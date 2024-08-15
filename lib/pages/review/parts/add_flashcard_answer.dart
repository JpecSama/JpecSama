import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/models/flashcard_answer.dart';
import 'package:jpec_sama/pages/review/bloc/review_bloc.dart';

import '../../../repositories/review_repository.dart';

class AddFlashcardAnswer extends StatefulWidget {
  const AddFlashcardAnswer({
    super.key,
    required ReviewRepository reviewRepository,
    required this.flashcard,
  }) : _reviewRepository = reviewRepository;

  final ReviewRepository _reviewRepository;
  final Flashcard flashcard;

  @override
  State<AddFlashcardAnswer> createState() => _AddFlashcardAnswerState();
}

class _AddFlashcardAnswerState extends State<AddFlashcardAnswer> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            context.translations.addPossibleAnswer,
            style: context.textTheme.titleMedium,
          ),
        ),
        TextFormField(
          controller: _controller,
        ),
        ElevatedButton(
          onPressed: () async {
            if (_controller.text.isEmpty) {
              return;
            }
            String newAnswer = _controller.text.trim();
            final newAnswerId = await widget._reviewRepository
                .addFlashcardAnswer(widget.flashcard.id!, newAnswer);
            if (newAnswerId != null) {
              context.showSnackBar(context.translations.successfullyUpdated);
              _controller.clear();
              context.read<ReviewBloc>().add(ReviewEvent.currentCardEdited(
                    flashcard: widget.flashcard.copyWith(flashcardAnswer: [
                      ...widget.flashcard.flashcardAnswer,
                      FlashcardAnswer(id: newAnswerId, answer: newAnswer)
                    ]),
                  ));
            } else {
              context.showSnackBar(context.translations.globalError,
                  isError: true);
            }
          },
          child: Text(
            context.translations.submit,
          ),
        ),
      ],
    );
  }
}
