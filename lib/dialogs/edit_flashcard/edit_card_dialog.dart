import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/theme/custom_theme.dart';

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
    return BlocBuilder<EditFlashcardBloc, EditFlashcardState>(
      buildWhen: (previous, current) => previous.flashcard != current.flashcard,
      builder: (context, state) {
        return EditCardDialogContent(flashcard: state.flashcard);
      },
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
      insetPadding: const EdgeInsets.symmetric(horizontal: 2 * kPadding),
      child: BlocBuilder<EditFlashcardBloc, EditFlashcardState>(
        buildWhen: (previous, current) =>
            previous.flashcard != current.flashcard,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 2 * kPadding, vertical: 2 * kPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: kPadding * 2),
                  child: Text(
                    context.translations.editFlashcard,
                    style: context.textTheme.titleLarge,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ebicha,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ebicha,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ebicha,
                      ),
                    ),
                  ),
                  controller: _textEditingController,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: kPadding * 2, bottom: kPadding),
                  child: Text(
                    context.translations.answers,
                    style: context.textTheme.titleMedium,
                  ),
                ),
                ..._answerControllers.asMap().entries.map(
                      (entry) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _answerControllers.removeAt(entry.key);
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: tonocha,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ebicha,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ebicha,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ebicha,
                              ),
                            ),
                          ),
                          controller: entry.value,
                        ),
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tonocha,
                    ),
                    onPressed: () {
                      setState(() {
                        _answerControllers.add(TextEditingController());
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4 * kPadding),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ebicha,
                    ),
                    onPressed: () {},
                    child: Text(context.translations.submit),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
