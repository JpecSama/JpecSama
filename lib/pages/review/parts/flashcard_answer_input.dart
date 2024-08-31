import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/widgets/japanese_text_field/controller/japanese_text_editing_controller.dart';

import '../bloc/review_bloc.dart';

class FlashcardAnswerInput extends StatefulWidget {
  const FlashcardAnswerInput({super.key});

  @override
  State<FlashcardAnswerInput> createState() => _FlashcardAnswerInputState();
}

class _FlashcardAnswerInputState extends State<FlashcardAnswerInput> {
  late final JapaneseTextEditingController _answerController;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _answerController = JapaneseTextEditingController();
    _answerController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  void _onAnswerSubmitted(String text) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    print('onFieldSubmitted $text');
    context
        .read<ReviewBloc>()
        .add(ReviewEvent.cardReviewed(givenAnswer: text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewBloc, ReviewState>(
      listenWhen: (previous, current) =>
          previous.currentCard?.destLanguage !=
              current.currentCard?.destLanguage ||
          previous.currentCardId != current.currentCardId,
      listener: (context, state) {
        _answerController.clear();
        if (state.currentCard?.destLanguage == 'JA') {
          _answerController.activateTranslating();
        } else {
          _answerController.deactivateTranslating();
        }
        setState(() {});
      },
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: BlocBuilder<ReviewBloc, ReviewState>(
              buildWhen: (previous, current) =>
                  previous.currentCard?.destLanguage !=
                      current.currentCard?.destLanguage ||
                  previous.hasReviewError != current.hasReviewError,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    controller: _answerController,
                    enableSuggestions: true,
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (state.hasReviewError) {
                        return null;
                      }
                      if (value?.trim().isEmpty ?? true) {
                        return context.translations.requiredFieldError;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: context.translations.answer,
                      hintText: state.currentCard?.destLanguage == 'JA'
                          ? '答え'
                          : 'Answer',
                      prefixIcon: state.currentCard?.destLanguage == 'JA'
                          ? const Icon(Icons.translate)
                          : const Icon(Icons.language),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _onAnswerSubmitted(_answerController.text);
                        },
                        icon: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ),
                    onFieldSubmitted: _onAnswerSubmitted,
                  ),
                );
              },
            ),
          ),
          BlocBuilder<ReviewBloc, ReviewState>(
            buildWhen: (previous, current) =>
                previous.currentCard != current.currentCard ||
                previous.currentCardIndex != current.currentCardIndex,
            builder: (context, state) {
              return state.currentCard?.destLanguage == 'JA'
                  ? Text(_answerController.japanese)
                  : Container();
            },
          )
        ],
      ),
    );
  }
}
