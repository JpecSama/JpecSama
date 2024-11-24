import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';

import '../../../theme/custom_theme.dart';
import '../bloc/review_bloc.dart';

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
                          previous.sessionAnswers != current.sessionAnswers ||
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
                      Text(
                        currentCard.flashcardText,
                        style: context.textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      BlocBuilder<ReviewBloc, ReviewState>(
                        buildWhen: (previous, current) =>
                            previous.isHintVisible != current.isHintVisible,
                        builder: (context, state) {
                          return state.isHintVisible && currentCard.hint != null
                              ? Text(
                                  currentCard.hint!,
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    color: Colors.black,
                                  ),
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${currentCard.sourceLanguage} => ${currentCard.destLanguage}',
                      style: context.textTheme.bodySmall!
                          .copyWith(color: sakuraIro),
                    ),
                    Text(
                      ' - ',
                      style: context.textTheme.bodySmall!
                          .copyWith(color: sakuraIro),
                    ),
                    Text(
                      "Level ${currentCard.level + 1}",
                      style: context.textTheme.bodySmall!
                          .copyWith(color: sakuraIro),
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
