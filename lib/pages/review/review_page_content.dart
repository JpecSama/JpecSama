import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/pages/dashboard/dashboard.dart';

import 'bloc/review_bloc.dart';
import 'parts/card_review_content.dart';

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
        if (state.isSessionEnded) {
          context.pushNamed(Dashboard.routeName);
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
                previous.currentCard != current.currentCard ||
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
