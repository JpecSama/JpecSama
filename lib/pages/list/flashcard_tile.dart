import 'package:flutter/material.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';

import '../../dialogs/edit_flashcard/edit_card_dialog.dart';
import '../../models/flashcard.dart';

class FlashcardTile extends StatelessWidget {
  const FlashcardTile({
    super.key,
    required this.flashcard,
  });
  final Flashcard flashcard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return EditCardDialog(
                flashcard: flashcard,
              );
            });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 2 * kPadding,
          vertical: kPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text.rich(
              TextSpan(
                children: ([
                  TextSpan(
                    text: flashcard.flashcardText,
                    style: context.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  flashcard.hint != null
                      ? TextSpan(
                          text: '- ${flashcard.hint!}',
                          style: context.textTheme.labelMedium,
                        )
                      : null
                ].where((span) => span != null).map((span) => span as TextSpan))
                    .toList(),
              ),
            ),
            Text(
              flashcard.flashcardAnswer.map((ans) => ans.answer).join(', '),
            ),
            Text(
              flashcard.nextAvailableAt.toIso8601String(),
              style: context.textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
