import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/pages/home/home_page.dart';
import 'package:jpec_sama/router.dart';

import 'bloc/review_bloc.dart';

class ReviewPageContent extends StatefulWidget {
  const ReviewPageContent({
    super.key,
  });

  @override
  State<ReviewPageContent> createState() => _ReviewPageContentState();
}

class _ReviewPageContentState extends State<ReviewPageContent> {
  _showExitReviewConfirmDialog() {
    showDialog(
        context: context,
        builder: (dialogContext) {
          //https://api.flutter.dev/flutter/material/AlertDialog-class.html
          return AlertDialog(
            title: const Text("Exit review?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  context.pushReplacementNamed(HomePage.routeName);
                },
                child: Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: Text("No"),
              ),
            ],
            elevation: 24.0,
            // backgroundColor: Colors.red,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        // title: Text('Review'),
        leading: IconButton(
          onPressed: _showExitReviewConfirmDialog,
          icon: const Icon(Icons.exit_to_app),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<ReviewBloc, ReviewState>(
          buildWhen: (previous, current) =>
              previous.currentCardIndex != current.currentCardIndex,
          builder: (context, state) {
            Flashcard? currentCard = state.currentCard;

            if (currentCard == null) {
              return const Center(
                child: Text('Nothing to do'),
              );
            }
            return CardReviewContent(
              currentCard: currentCard,
            );
          },
        ),
      ),
    );
  }
}

class CardReviewContent extends StatefulWidget {
  const CardReviewContent({
    super.key,
    required this.currentCard,
  });

  final Flashcard currentCard;

  @override
  State<CardReviewContent> createState() => _CardReviewContentState();
}

class _CardReviewContentState extends State<CardReviewContent> {
  late final TextEditingController _answerController = TextEditingController();

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  Flashcard get currentCard => widget.currentCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.deepPurple,
          height: MediaQuery.of(context).size.height * 0.20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(currentCard.flashcardText),
                        BlocBuilder<ReviewBloc, ReviewState>(
                          buildWhen: (previous, current) =>
                              previous.isHintVisible != current.isHintVisible,
                          builder: (context, state) {
                            return state.isHintVisible &&
                                    currentCard.hint != null
                                ? Text(currentCard.hint!)
                                : Container();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(child: Text('Flashcard')),
                ),
              )
            ],
          ),
        ),
        TextFormField(
          controller: _answerController,
          enableSuggestions: false,
          decoration: const InputDecoration(
            labelText: 'Answer',
            suffixIcon: Icon(Icons.arrow_circle_right_outlined),
          ),
          onFieldSubmitted: (value) {
            print('onFieldSubmitted $value');
            context
                .read<ReviewBloc>()
                .add(ReviewEvent.cardReviewed(givenAnswer: value.trim()));
            _answerController.clear();
          },
        ),
        Expanded(
          child: BlocBuilder<ReviewBloc, ReviewState>(
            buildWhen: (previous, current) =>
                previous.hasReviewError != current.hasReviewError ||
                previous.isAnswerVisible != current.isAnswerVisible,
            builder: (context, state) {
              if (!state.isAnswerVisible) {
                return Container();
              }
              return Column(
                children: [
                  Text(
                    currentCard.flashcardAnswer
                        .map(
                          (f) => f.answer,
                        )
                        .join(','),
                  ),
                  currentCard.answerInfos == null
                      ? Container()
                      : Text(currentCard.answerInfos!),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
