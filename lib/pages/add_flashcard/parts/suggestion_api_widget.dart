import 'package:flutter/material.dart';
import 'package:jpec_sama/pages/add_flashcard/deepl_suggestions.dart';
import 'package:jpec_sama/typedef.dart';
import 'package:kana_romaji_translator/kana_romaji_translator.dart';

import '../jisho_suggestions.dart';

class SuggestionApiWidget extends StatelessWidget {
  const SuggestionApiWidget({
    super.key,
    required this.translatorApi,
    required this.searchText,
    required this.sourceLang,
    required this.targetLang,
    required this.onTranslationClicked,
    this.suggestionScrollPhysics,
  });
  final String translatorApi;
  final String searchText;
  final String sourceLang;
  final String targetLang;
  final OnTranslationClicked onTranslationClicked;
  final ScrollPhysics? suggestionScrollPhysics;

  @override
  Widget build(BuildContext context) {
    switch (translatorApi) {
      case DeeplSuggestions.suggestionApiName:
        JapaneseTextTranslator japaneseTextTranslator =
            JapaneseTextTranslator();
        String usedSearchText = sourceLang == 'JA' &&
                !JapaneseCharacterMatcher.doesStringContainsJapaneseCharacters(
                    searchText)
            ? japaneseTextTranslator.getHiragana(searchText)
            : searchText;
        return DeeplSuggestions(
          searchText: usedSearchText,
          sourceLang: sourceLang,
          targetLang: targetLang,
          onTranslationClicked: onTranslationClicked,
          suggestionScrollPhysics: suggestionScrollPhysics,
        );
      case JishoSuggestions.suggestionApiName:
        return JishoSuggestions(
          searchText: searchText,
          sourceLang: sourceLang,
          targetLang: targetLang,
          onTranslationClicked: onTranslationClicked,
          suggestionScrollPhysics: suggestionScrollPhysics,
        );
    }
    return Container();
  }
}
