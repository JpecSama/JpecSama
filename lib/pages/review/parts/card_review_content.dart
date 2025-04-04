import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/pages/review/parts/flashcard_answer_input.dart';

import '../../../models/flashcard.dart';
import '../../../services/supabase/repositories/review_repository.dart';
import '../../../theme/custom_theme.dart';
import '../bloc/review_bloc.dart';
import 'add_flashcard_answer.dart';
import 'flashcard_head.dart';

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
  final ReviewRepository _reviewRepository = ReviewRepository();

  Flashcard get currentCard => widget.currentCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlashcardHead(
          currentCard: currentCard,
        ),
        Expanded(
          child: BlocBuilder<ReviewBloc, ReviewState>(
            buildWhen: (previous, current) =>
                previous.hasReviewError != current.hasReviewError ||
                previous.isAnswerVisible != current.isAnswerVisible,
            builder: (context, state) {
              Color? backgroundColor = state.isAnswerVisible
                  ? (state.hasReviewError
                      ? CustomTheme.momoIro.withAlpha(230)
                      : CustomTheme.mizuasagi.withAlpha(150))
                  : null;
              return Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const FlashcardAnswerInput(),
                    Expanded(
                      child: BlocBuilder<ReviewBloc, ReviewState>(
                        buildWhen: (previous, current) =>
                            previous.hasReviewError != current.hasReviewError ||
                            previous.isAnswerVisible != current.isAnswerVisible,
                        builder: (context, state) {
                          if (!state.isAnswerVisible) {
                            return Container();
                          }
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: kPadding * 4,
                                    horizontal: kPadding,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        currentCard.flashcardAnswer
                                            .map(
                                              (f) => f.answer,
                                            )
                                            .join(','),
                                        style: context.textTheme.bodyLarge!
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      currentCard.answerInfos == null
                                          ? Container()
                                          : Text(
                                              currentCard.answerInfos!,
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: AddFlashcardAnswer(
                                    flashcard: currentCard,
                                    reviewRepository: _reviewRepository,
                                    buttonBackgroundColor: state.hasReviewError
                                        ? CustomTheme.mizuasagi
                                        : CustomTheme.momoIro.withAlpha(230),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
