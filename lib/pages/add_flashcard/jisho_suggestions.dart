import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/api/jisho/jisho_translation.dart';
import 'package:jpec_sama/models/api/jisho/jisho_translation_answer.dart';
import 'package:jpec_sama/services/supabase/repositories/user_cred_repository.dart';
import 'package:jpec_sama/services/supabase/repositories/user_repository.dart';
import 'package:jpec_sama/services/jisho_service.dart';

import '../../models/api/api_translation.dart';
import '../../typedef.dart';

class JishoSuggestions extends StatefulWidget {
  const JishoSuggestions({
    super.key,
    required this.searchText,
    required this.sourceLang,
    required this.targetLang,
    required this.onTranslationClicked,
    this.suggestionScrollPhysics,
  });
  final String searchText;
  final String sourceLang;
  final String targetLang;
  final OnTranslationClicked onTranslationClicked;
  final ScrollPhysics? suggestionScrollPhysics;
  static const suggestionApiName = 'jisho';

  @override
  State<JishoSuggestions> createState() => _JishoSuggestionsState();
}

class _JishoSuggestionsState extends State<JishoSuggestions> {
  late Future<JishoTranslationAnswer?> _jishoTranslationAnswerFuture;

  @override
  void initState() {
    _jishoTranslationAnswerFuture = Future.value(null);
    super.initState();
  }

  Future<void> _fetchDeeplTranslations() async {
    if (widget.searchText.isEmpty) {
      setState(() {
        _jishoTranslationAnswerFuture = Future.value(null);
      });
      context.showSnackBar("Nothing to search.", isError: true);
      return;
    }
    String? userId = UserRepository.getCurrentUserId();
    if (userId == null) {
      context.showSnackBar("You must be authenticated to perform this action",
          isError: true);
      return;
    }
    UserCredRepository userCredRepo = UserCredRepository();
    String? deeplApiKey = await userCredRepo.getDeeplApiKey(userId);
    if (deeplApiKey == null) {
      context.showSnackBar(
          "You must be have configured a deepl API key to perform this action",
          isError: true);
      return;
    }
    JishoService jishoService = JishoService();

    setState(() {
      _jishoTranslationAnswerFuture = jishoService.translate(widget.searchText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: _jishoTranslationAnswerFuture,
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return Container();
            }
            JishoTranslationAnswer jishoTranslationAnswer = snapshot.data;

            return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: kPadding),
                shrinkWrap: true,
                physics: widget.suggestionScrollPhysics,
                itemCount: min(jishoTranslationAnswer.data.length, 5),
                itemBuilder: (context, index) {
                  JishoTranslation translation =
                      jishoTranslationAnswer.data[index];

                  String translationText = translation
                          .senses.firstOrNull?.englishDefinitions.firstOrNull ??
                      'No translation';
                  String? hint;
                  if (widget.sourceLang == 'EN') {
                    translationText = translation.japanese?.firstOrNull?.word ??
                        translation.japanese?.first.reading ??
                        'No translation';
                    hint = translation.japanese?.firstOrNull?.word != null
                        ? translation.japanese?.firstOrNull?.reading
                        : null;
                  }
                  return Container(
                    margin: const EdgeInsets.only(bottom: kPadding),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      onTap: () {
                        widget.onTranslationClicked(
                          ApiTranslation.fromJisho(
                            translation,
                            destLocale: widget.targetLang,
                          ),
                        );
                      },
                      title: Text(
                        translationText,
                      ),
                      subtitle: hint != null
                          ? Text(
                              hint,
                              style: context.textTheme.labelMedium,
                            )
                          : null,
                    ),
                  );
                });
          },
        ),
        ElevatedButton(
          onPressed:
              widget.searchText.isNotEmpty && widget.targetLang.isNotEmpty
                  ? _fetchDeeplTranslations
                  : null,
          child: const Text('Search'),
        ),
      ],
    );
  }
}
