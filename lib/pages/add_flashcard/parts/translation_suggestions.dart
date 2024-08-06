import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/typedef.dart';

import '../../../theme/theme_title.dart';
import '../bloc/add_flashcard_bloc.dart';
import '../deepl_suggestions.dart';
import '../jisho_suggestions.dart';

class TranslationSuggestions extends StatefulWidget {
  const TranslationSuggestions({super.key, required this.onTranslationClicked});
  final OnTranslationClicked onTranslationClicked;

  @override
  State<TranslationSuggestions> createState() => _TranslationSuggestionsState();
}

class _TranslationSuggestionsState extends State<TranslationSuggestions>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: ThemeTitle(
              title: 'Translation suggestions',
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            child: BlocBuilder<AddFlashcardBloc, AddFlashcardState>(
              buildWhen: (previous, current) =>
                  previous.translatorApi != current.translatorApi ||
                  previous.sourceLocale != current.sourceLocale ||
                  previous.destLocale != current.destLocale ||
                  previous.searchText != current.searchText,
              builder: (context, state) {
                return Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'DeepL'),
                        Tab(text: 'Jisho'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          DeeplSuggestions(
                            sourceLang: state.sourceLocale,
                            targetLang: state.destLocale,
                            searchText: state.searchText,
                            suggestionScrollPhysics:
                                const NeverScrollableScrollPhysics(),
                            onTranslationClicked: widget.onTranslationClicked,
                          ),
                          JishoSuggestions(
                            sourceLang: state.sourceLocale,
                            targetLang: state.destLocale,
                            searchText: state.searchText,
                            suggestionScrollPhysics:
                                const NeverScrollableScrollPhysics(),
                            onTranslationClicked: widget.onTranslationClicked,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
