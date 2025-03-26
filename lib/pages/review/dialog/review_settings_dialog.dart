import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/dialogs/edit_flashcard/edit_card_dialog.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/pages/review/bloc/review_bloc.dart';
import 'package:jpec_sama/theme/custom_theme.dart';

class ReviewSettingsDialog extends StatelessWidget {
  const ReviewSettingsDialog({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: CustomTheme.shironeri,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close),
              ),
              title: Text('Settings'),
            ),
            BlocBuilder<ReviewBloc, ReviewState>(
              buildWhen: (previous, current) =>
                  previous.shouldAlwaysShowAnswer !=
                  current.shouldAlwaysShowAnswer,
              builder: (context, state) {
                return ListTile(
                  selected: state.shouldAlwaysShowAnswer,
                  title: const Text('Always show answer'),
                  subtitle: const Text(
                    'Show the answer immediately after submitting your answer',
                  ),
                  leading: Switch(
                    value: state.shouldAlwaysShowAnswer,
                    onChanged: (value) {
                      context.read<ReviewBloc>().add(
                            ReviewEvent.alwaysShowAnswerToggled(),
                          );
                    },
                  ),
                );
              },
            ),
            BlocBuilder<ReviewBloc, ReviewState>(
              buildWhen: (previous, current) =>
                  previous.isMuted != current.isMuted,
              builder: (context, state) {
                return ListTile(
                  selected: !state.isMuted,
                  title: const Text('With sound'),
                  subtitle: const Text(
                    'Wheter a sound is played when a new card is presented or not',
                  ),
                  leading: Switch(
                    value: !state.isMuted,
                    onChanged: (value) {
                      context.read<ReviewBloc>().add(
                            ReviewEvent.muteToggled(),
                          );
                    },
                  ),
                );
              },
            ),
            ListTile(
              onTap: () {
                Flashcard? flashcard =
                    context.read<ReviewBloc>().state.currentCard;
                if (flashcard == null) {
                  return;
                }
                showDialog(
                  context: context,
                  builder: (dialogContext) => EditCardDialog(
                    flashcard: flashcard,
                    onFlashcardUpdated: (flashcard) {
                      context.read<ReviewBloc>().add(
                            ReviewEvent.currentCardEdited(flashcard: flashcard),
                          );
                      Navigator.of(dialogContext).pop();
                    },
                  ),
                );
              },
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              subtitle: const Text(
                'Edit the current card',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
