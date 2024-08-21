import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/pages/add_flashcard/bloc/add_flashcard_bloc.dart';
import 'package:jpec_sama/pages/add_flashcard/parts/translation_suggestions.dart';
import 'package:jpec_sama/repositories/review_repository.dart';
import 'package:jpec_sama/widgets/japanese_text_field/controller/japanese_dynamic_text_editing_controller.dart';

import '../../models/api/api_translation.dart';
import '../../repositories/user_repository.dart';
import 'parts/select_flashcard_locales_header.dart';

class AddFlashcardPage extends StatelessWidget {
  const AddFlashcardPage({super.key});
  static const routeName = 'Add flashcard';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddFlashcardBloc()..add(const AddFlashcardEvent.started()),
      child: const AddFlashcardPageContent(),
    );
  }
}

class AddFlashcardPageContent extends StatefulWidget {
  const AddFlashcardPageContent({super.key});

  @override
  State<AddFlashcardPageContent> createState() =>
      _AddFlashcardPageContentState();
}

class _AddFlashcardPageContentState extends State<AddFlashcardPageContent> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final JapaneseTextEditingController _searchTextController =
      JapaneseTextEditingController();
  final TextEditingController _hintController = TextEditingController();
  final List<TextEditingController> _answerControllers = [
    TextEditingController()
  ];

  bool _isSubmitting = false;

  @override
  void initState() {
    _searchTextController.addListener(() {
      context.read<AddFlashcardBloc>().add(AddFlashcardEvent.searchTextChanged(
          searchText: _searchTextController.text.trim()));
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  Future<bool> _submitCard(AddFlashcardState state) async {
    if (_isSubmitting) {
      return false;
    }
    if (!(_formKey.currentState?.validate() ?? false)) {
      return false;
    }
    setState(() {
      _isSubmitting = true;
    });
    try {
      String? userId = UserRepository.getCurrentUserId();
      if (userId == null) {
        context.showSnackBar(context.translations.authenticatedAction);
        return false;
      }
      final repo = ReviewRepository();
      String hintText = _hintController.text.trim();
      bool isSuccess = await repo.createFlashcard(
        userId,
        Flashcard(
          nextAvailableAt: DateTime.now(),
          flashcardText: state.searchText,
          hint: hintText.isNotEmpty ? hintText : null,
          sourceLanguage: state.sourceLocale,
          destLanguage: state.destLocale,
          userId: userId,
        ),
        _answerControllers
            .map((controller) => controller.text.trim())
            .where((text) => text.isNotEmpty)
            .toList(),
        state.isReversable,
      );
      if (isSuccess) {
        _resetForm();
      }
      setState(() {
        _isSubmitting = false;
      });
      return isSuccess;
    } catch (e) {
      print(e);
    }
    setState(() {
      _isSubmitting = false;
    });
    return false;
  }

  void _resetForm() {
    _searchTextController.clear();
    _hintController.clear();
    for (int i = 0; i < _answerControllers.length; i++) {
      var answerController = _answerControllers[i];
      _answerControllers.removeAt(i);
      answerController.dispose();
    }
    _answerControllers.add(TextEditingController());

    _searchTextController.clear();
    context
        .read<AddFlashcardBloc>()
        .add(const AddFlashcardEvent.searchTextChanged(searchText: ''));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translations.addFlashcard),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Scrollbar(
            // thumbVisibility: true,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    //AutofillHint
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SelectFlashcardLocalesHeader(),
                          BlocConsumer<AddFlashcardBloc, AddFlashcardState>(
                            listener: (context, state) {
                              if (state.sourceLocale == 'JA') {
                                _searchTextController.activateTranslating();
                              } else {
                                _searchTextController.deactivateTranslating();
                              }
                            },
                            builder: (context, state) {
                              return Column(
                                children: [
                                  TextFormField(
                                    controller: _searchTextController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return context
                                            .translations.requiredFieldError;
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      label: Text(
                                        context.translations.toTranslate,
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                    ),
                                  ),
                                  _searchTextController.isTranslatingToJapanese
                                      ? Text(_searchTextController.japanese)
                                      : Container(),
                                ],
                              );
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: _hintController,
                              decoration: InputDecoration(
                                label: Text(
                                    "${context.translations.hint} ${context.translations.optional_}"),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                helperText:
                                    context.translations.hintDescription,
                              ),
                            ),
                          ),
                          // Add TabBar View with multiple API
                          TranslationSuggestions(
                            onTranslationClicked: (ApiTranslation translation) {
                              String translationText = translation.text;

                              bool isSet = false;
                              for (var controller in _answerControllers) {
                                String controllerText = controller.text.trim();
                                if (controllerText.isEmpty ||
                                    controllerText == translation.text) {
                                  controller.text = translationText;
                                  isSet = true;
                                  break;
                                }
                              }
                              if (!isSet) {
                                setState(() {
                                  _answerControllers.add(TextEditingController(
                                    text: translationText,
                                  ));
                                });
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: BlocBuilder<AddFlashcardBloc,
                                AddFlashcardState>(
                              buildWhen: (previous, current) =>
                                  previous.isReversable != current.isReversable,
                              builder: (context, state) {
                                return CheckboxListTile(
                                  value: state.isReversable,
                                  title: Text(
                                    context.translations.isReversable,
                                  ),
                                  subtitle: Text(
                                    context
                                        .translations.isReversableDescription,
                                    style: context.textTheme.labelMedium,
                                  ),
                                  onChanged: (val) {
                                    context.read<AddFlashcardBloc>().add(
                                        const AddFlashcardEvent
                                            .reversableToggled());
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _answerControllers.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _answerControllers
                                                  .removeAt(index);
                                            });
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            controller:
                                                _answerControllers[index],
                                            decoration: InputDecoration(
                                              label: Text(
                                                context.translations
                                                    .possibleAnswer(index + 1),
                                                style: context
                                                    .textTheme.labelMedium,
                                              ),
                                              hintText: context
                                                  .translations.answerOptional,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _answerControllers.add(TextEditingController());
                              });
                            },
                            icon: const Icon(Icons.add_circle_outline_outlined),
                          ),

                          BlocBuilder<AddFlashcardBloc, AddFlashcardState>(
                            buildWhen: (previous, current) =>
                                previous != current,
                            builder: (context, state) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  top: kPadding,
                                  bottom: kPadding * 5,
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () => _submitCard(state),
                                  icon: const Icon(
                                    Icons.create_outlined,
                                  ),
                                  label: Text(
                                    context.translations.create,
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
