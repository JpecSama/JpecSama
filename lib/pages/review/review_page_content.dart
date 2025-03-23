import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/pages/dashboard/dashboard.dart';
import 'package:jpec_sama/theme/custom_theme.dart';

import 'bloc/review_bloc.dart';
import 'dialog/review_settings_dialog.dart';
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
        backgroundColor: CustomTheme.momoIro,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Review'),
          leading: IconButton(
            onPressed: _showExitReviewConfirmDialog,
            icon: const Icon(Icons.exit_to_app),
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return BlocProvider.value(
                      value: context.read<ReviewBloc>(),
                      child: ReviewSettingsDialog(),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: BlocBuilder<ReviewBloc, ReviewState>(
              buildWhen: (previous, current) =>
                  previous.isInitialising != current.isInitialising ||
                  previous.currentCard != current.currentCard ||
                  previous.currentCardId != current.currentCardId,
              builder: (context, state) {
                print(
                    "ReviewPageContent: state: ${state.currentCard?.flashcardText}");
                if (state.isInitialising) {
                  return Center(child: const CircularProgressIndicator());
                }
                Flashcard? currentCard = state.currentCard;

                if (state.flashcards.isEmpty || currentCard == null) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlocBuilder<ReviewBloc, ReviewState>(
                          buildWhen: (previous, current) =>
                              previous.isSubmitting != current.isSubmitting ||
                              previous.submissionError !=
                                  current.submissionError,
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
                              child:
                                  Text(context.translations.endReviewSession),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }
                return CardReviewContent(
                  key: UniqueKey(),
                  currentCard: currentCard,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
