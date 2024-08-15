import 'package:flutter/material.dart';
import 'package:jpec_sama/extensions/context_extension.dart';

import '../../../repositories/review_repository.dart';

class AddFlashcardAnswer extends StatefulWidget {
  const AddFlashcardAnswer({
    super.key,
    required ReviewRepository reviewRepository,
    required this.flashcardId,
  }) : _reviewRepository = reviewRepository;

  final ReviewRepository _reviewRepository;
  final String flashcardId;

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
            "Add possible answer",
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
            final isSuccess = await widget._reviewRepository.addFlashcardAnswer(
                widget.flashcardId, _controller.text.trim());
            if (isSuccess) {
              context.showSnackBar(context.translations.successfullyUpdated);
              _controller.clear();
            } else {
              context.showSnackBar('Error', isError: true);
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
