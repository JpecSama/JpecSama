import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';

import 'bloc/edit_flashcard_bloc.dart';

class EditCardDialog extends StatelessWidget {
  const EditCardDialog({
    super.key,
    required this.flashcard,
  });
  final Flashcard flashcard;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditFlashcardBloc(initialFlashcard: flashcard)
        ..add(const EditFlashcardEvent.started()),
      child: const EditCardDialogWrapper(),
    );
  }
}

class EditCardDialogWrapper extends StatelessWidget {
  const EditCardDialogWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<EditFlashcardBloc, EditFlashcardState>(
        buildWhen: (previous, current) =>
            previous.flashcard != current.flashcard,
        builder: (context, state) {
          return EditCardDialogContent(flashcard: state.flashcard);
        },
      ),
    );
  }
}

class EditCardDialogContent extends StatefulWidget {
  const EditCardDialogContent({super.key, required this.flashcard});
  final Flashcard flashcard;

  @override
  State<EditCardDialogContent> createState() => _EditCardDialogContentState();
}

class _EditCardDialogContentState extends State<EditCardDialogContent> {
  late TextEditingController _textEditingController;
  late List<TextEditingController> _answerControllers;

  @override
  void initState() {
    super.initState();
    _textEditingController =
        TextEditingController(text: widget.flashcard.flashcardText);
    _answerControllers = widget.flashcard.flashcardAnswer
        .map((answer) => TextEditingController(text: answer.answer))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<EditFlashcardBloc, EditFlashcardState>(
        buildWhen: (previous, current) =>
            previous.flashcard != current.flashcard,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.translations.editFlashcard,
                style: context.textTheme.titleLarge,
              ),
              TextFormField(
                controller: _textEditingController,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: kPadding * 2, bottom: kPadding),
                child: Text(
                  context.translations.answers,
                  style: context.textTheme.titleMedium,
                ),
              ),
              ..._answerControllers.map(
                (controller) => TextFormField(
                  controller: controller,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(context.translations.submit),
              )
            ],
          );
        },
      ),
    );
  }
}
