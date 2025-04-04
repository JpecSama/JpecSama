import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/typedef.dart';

import '../../../theme/theme_title.dart';
import '../api/api_translator.dart';
import '../bloc/add_flashcard_bloc.dart';
import 'suggestion_api_widget.dart';

class TranslationSuggestions extends StatefulWidget {
  const TranslationSuggestions({super.key, required this.onTranslationClicked});
  final OnTranslationClicked onTranslationClicked;

  @override
  State<TranslationSuggestions> createState() => _TranslationSuggestionsState();
}

class _TranslationSuggestionsState extends State<TranslationSuggestions>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ApiTranslator _translatorApi = ApiTranslator.jisho;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          BlocBuilder<AddFlashcardBloc, AddFlashcardState>(
            buildWhen: (previous, current) =>
                previous.translatorApi != current.translatorApi ||
                previous.sourceLocale != current.sourceLocale ||
                previous.possibleTranslatorApis !=
                    current.possibleTranslatorApis ||
                previous.destLocale != current.destLocale ||
                previous.searchText != current.searchText,
            builder: (context, state) {
              if (state.possibleTranslatorApis.isEmpty) {
                return SizedBox.shrink();
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ThemeTitle(
                          title: context.translations.translationSuggestions,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: DropdownMenu(
                            initialSelection: _translatorApi,
                            onSelected: (label) {
                              if (label != null) {
                                setState(() {
                                  _translatorApi = label;
                                });
                              }
                            },
                            dropdownMenuEntries: state.possibleTranslatorApis
                                .map(
                                  (api) => DropdownMenuEntry(
                                    value: api,
                                    label: api.toString().split('.').last,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SuggestionApiWidget(
                    sourceLang: state.sourceLocale,
                    targetLang: state.destLocale,
                    searchText: state.searchText,
                    translatorApi: _translatorApi,
                    suggestionScrollPhysics:
                        const NeverScrollableScrollPhysics(),
                    onTranslationClicked: widget.onTranslationClicked,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
