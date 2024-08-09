import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/pages/dashboard/dashboard.dart';
import 'package:jpec_sama/pages/home/home_page.dart';

import '../../theme/custom_theme.dart';
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
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                onPressed: () {
                  // Navigator.of(dialogContext).pop();
                  context
                      .read<ReviewBloc>()
                      .add(const ReviewEvent.sessionSaved());
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
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewBloc, ReviewState>(
      listenWhen: (previous, current) =>
          previous.isSessionEnded != current.isSessionEnded,
      listener: (context, state) {
        print("state.isSessionEnded ${state.isSessionEnded}");
        if (state.isSessionEnded) {
          print("Push replacement");

          context.pushNamed(DashboardPage.routeName);
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
                previous.isInitialising != current.isInitialising ||
                previous.currentCardIndex != current.currentCardIndex,
            builder: (context, state) {
              if (state.isInitialising) {
                return const CircularProgressIndicator();
              }
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
    // _answerController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewBloc, ReviewState>(
      listenWhen: (previous, current) =>
          previous.currentCardIndex != current.currentCardIndex,
      listener: (context, state) {
        _answerController.clear();
      },
      child: Column(
        children: [
          Container(
            color: Colors.grey.withAlpha(50),
            height: MediaQuery.of(context).size.height * 0.20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<ReviewBloc>()
                                  .add(const ReviewEvent.hintToggled());
                            },
                            icon: const Icon(
                              Icons.question_mark_outlined,
                              size: 14,
                            ),
                          ),
                          BlocBuilder<ReviewBloc, ReviewState>(
                            buildWhen: (previous, current) =>
                                previous.sessionAnswers !=
                                    current.sessionAnswers ||
                                previous.flashcards != current.flashcards,
                            builder: (context, state) {
                              return Text(
                                  "${state.sessionAnswers.length}/${state.flashcards.length}");
                            },
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(currentCard.flashcardText),
                            BlocBuilder<ReviewBloc, ReviewState>(
                              buildWhen: (previous, current) =>
                                  previous.isHintVisible !=
                                  current.isHintVisible,
                              builder: (context, state) {
                                return state.isHintVisible &&
                                        currentCard.hint != null
                                    ? Text(
                                        currentCard.hint!,
                                        style: context.textTheme.labelMedium,
                                      )
                                    : Container();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: tonocha,
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
                        style: context.textTheme.bodySmall!
                            .copyWith(color: sakuraIro),
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
                    enableSuggestions: true,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
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
                    color: state.hasReviewError ? momoIro : mizuasagi,
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: kPadding * 4),
                            child: Column(
                              children: [
                                Text(
                                  currentCard.flashcardAnswer
                                      .map(
                                        (f) => f.answer,
                                      )
                                      .join(','),
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                currentCard.answerInfos == null
                                    ? Container()
                                    : Text(
                                        currentCard.answerInfos!,
                                        style: context.textTheme.bodyMedium,
                                      ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    "Add possible answer",
                                    style: context.textTheme.titleMedium,
                                  ),
                                ),
                                TextFormField(),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Submit'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
