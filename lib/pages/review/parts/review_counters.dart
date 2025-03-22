import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/pages/review/bloc/review_bloc.dart';

class ReviewCounters extends StatelessWidget {
  const ReviewCounters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      buildWhen: (previous, current) =>
          previous.sessionAnswers != current.sessionAnswers ||
          previous.flashcards != current.flashcards,
      builder: (context, state) {
        int correctCount =
            state.sessionAnswers.where((a) => a.isCorrect).length;
        int incorrectCount =
            state.sessionAnswers.where((a) => !a.isCorrect).length;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 3,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8,
            children: [
              Row(
                spacing: 2,
                children: [
                  Text(
                    correctCount.toString(),
                    style: context.textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                ],
              ),
              Row(
                spacing: 2,
                children: [
                  Text(
                    incorrectCount.toString(),
                    style: context.textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ],
              ),
              Row(
                spacing: 2,
                children: [
                  Text(
                    "${state.flashcards.length}/${state.flashcards.length + correctCount}",
                    style: context.textTheme.bodySmall,
                  ),
                  Icon(Icons.inbox_outlined),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
