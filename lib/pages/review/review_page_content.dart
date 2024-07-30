import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/pages/home/home_page.dart';

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
            title: Text(
              context.translations.endReviewSession,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  context.pushReplacementNamed(HomePage.routeName);
                },
                child: Text(context.translations.yes),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: Text(context.translations.no),
              ),
            ],
            elevation: 24.0,
            // backgroundColor: Colors.red,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewBloc, ReviewState>(
      listenWhen: (previous, current) =>
          previous.isSessionEnded != current.isSessionEnded,
      listener: (context, state) {
        if (state.isSessionEnded) {
          context.pushReplacementNamed(HomePage.routeName);
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Review'),
          leading: IconButton(
            onPressed: _showExitReviewConfirmDialog,
            icon: const Icon(Icons.exit_to_app),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: BlocBuilder<ReviewBloc, ReviewState>(
            buildWhen: (previous, current) =>
                previous.currentCardIndex != current.currentCardIndex,
            builder: (context, state) {
              Flashcard? currentCard = state.currentCard;

              if (currentCard == null) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: BlocBuilder<ReviewBloc, ReviewState>(
                        buildWhen: (previous, current) =>
                            previous.isSubmitting != current.isSubmitting ||
                            previous.submissionError != current.submissionError,
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              if (state.isSubmitting) {
                                return;
                              }
                              context.read<ReviewBloc>().add(
                                    const ReviewEvent.sessionSaved(),
                                  );
                            },
                            child: Text(context.translations.endReviewSession),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return CardReviewContent(
                currentCard: currentCard,
              );
            },
          ),
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
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  Flashcard get currentCard => widget.currentCard;

  void _onAnswerSubmitted(String text) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    print('onFieldSubmitted $text');
    context
        .read<ReviewBloc>()
        .add(ReviewEvent.cardReviewed(givenAnswer: text.trim()));
    _answerController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey.withAlpha(50),
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
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  border: Border.symmetric(
                    vertical: BorderSide(color: Colors.black),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Text(
                      // context.translations.answer.toUpperCase(),
                      "Level ${currentCard.level + 1}",
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Form(
          key: _formKey,
          child: BlocBuilder<ReviewBloc, ReviewState>(
            buildWhen: (previous, current) =>
                previous.hasReviewError != current.hasReviewError,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: _answerController,
                  enableSuggestions: false,
                  validator: (value) {
                    if (state.hasReviewError) {
                      return null;
                    }
                    if (value?.trim().isEmpty ?? true) {
                      return context.translations.requiredFieldError;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: context.translations.answer,
                    suffixIcon: IconButton(
                      onPressed: () {
                        _onAnswerSubmitted(_answerController.text);
                      },
                      icon: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  onFieldSubmitted: _onAnswerSubmitted,
                ),
              );
            },
          ),
        ),
        BlocBuilder<ReviewBloc, ReviewState>(
          buildWhen: (previous, current) =>
              previous.hasReviewError != current.hasReviewError ||
              previous.isAnswerVisible != current.isAnswerVisible,
          builder: (context, state) {
            if (!state.isAnswerVisible) {
              return Container();
            }
            return Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: state.hasReviewError ? Colors.red : Colors.green,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
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
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
