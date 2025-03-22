import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';

import '../../../theme/custom_theme.dart';
import '../bloc/review_bloc.dart';
import 'review_counters.dart';

class FlashcardHead extends StatelessWidget {
  const FlashcardHead({
    super.key,
    required this.currentCard,
  });

  final Flashcard currentCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withAlpha(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<ReviewBloc>()
                            .add(const ReviewEvent.hintToggled());
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Icon(
                          Icons.question_mark_outlined,
                          size: 14,
                        ),
                      ),
                    ),
                    ReviewCounters(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 8.0,
                    bottom: 24.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<ReviewBloc>().add(
                                const ReviewEvent.hintToggled(),
                              );
                        },
                        child: Text(
                          currentCard.flashcardText,
                          style: context.textTheme.headlineMedium!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      BlocBuilder<ReviewBloc, ReviewState>(
                        buildWhen: (previous, current) =>
                            previous.isHintVisible != current.isHintVisible,
                        builder: (context, state) {
                          return state.isHintVisible && currentCard.hint != null
                              ? Text(
                                  currentCard.hint!,
                                  style: context.textTheme.titleLarge!.copyWith(
                                    color: Colors.black,
                                  ),
                                )
                              : Container();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: mizuasagi,
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${currentCard.sourceLanguage} => ${currentCard.destLanguage}',
                      style: context.textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' - ',
                      style: context.textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Level ${currentCard.level + 1}",
                      style: context.textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
