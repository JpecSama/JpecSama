import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/typedef.dart';

import '../../../theme/theme_title.dart';
import '../bloc/add_flashcard_bloc.dart';
import '../deepl_suggestions.dart';

class TranslationSuggestions extends StatelessWidget {
  const TranslationSuggestions({super.key, required this.onTranslationClicked});
  final OnTranslationClicked onTranslationClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: ThemeTitle(
              title: 'Translation suggestions',
            ),
          ),
          BlocBuilder<AddFlashcardBloc, AddFlashcardState>(
            buildWhen: (previous, current) =>
                previous.sourceLocale != current.sourceLocale ||
                previous.destLocale != current.destLocale ||
                previous.searchText != current.searchText,
            builder: (context, state) {
              return DeeplSuggestions(
                sourceLang: state.sourceLocale,
                targetLang: state.destLocale,
                searchText: state.searchText,
                suggestionScrollPhysics: const NeverScrollableScrollPhysics(),
                onTranslationClicked: onTranslationClicked,
              );
            },
          ),
        ],
      ),
    );
  }
}
