import 'package:flutter/material.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/api/deepl_translation_answer.dart';
import 'package:jpec_sama/models/api/deepl_translation_request.dart';
import 'package:jpec_sama/services/supabase/repositories/user_cred_repository.dart';
import 'package:jpec_sama/services/supabase/repositories/user_repository.dart';

import '../../models/api/api_translation.dart';
import '../../models/api/deepl_translation.dart';
import '../../services/deepl_service.dart';
import '../../typedef.dart';

class DeeplSuggestions extends StatefulWidget {
  const DeeplSuggestions({
    super.key,
    required this.searchText,
    required this.sourceLang,
    required this.targetLang,
    required this.onTranslationClicked,
    this.suggestionScrollPhysics,
  });
  static const suggestionApiName = 'deepl';
  final String searchText;
  final String sourceLang;
  final String targetLang;
  final OnTranslationClicked onTranslationClicked;
  final ScrollPhysics? suggestionScrollPhysics;

  @override
  State<DeeplSuggestions> createState() => _DeeplSuggestionsState();
}

class _DeeplSuggestionsState extends State<DeeplSuggestions> {
  late Future<DeeplTranslationAnswer?> _deeplTranslationAnswerFuture;

  @override
  void initState() {
    _deeplTranslationAnswerFuture = Future.value(null);
    super.initState();
  }

  Future<void> _fetchDeeplTranslations() async {
    if (widget.searchText.isEmpty) {
      setState(() {
        _deeplTranslationAnswerFuture = Future.value(null);
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
    DeeplService deeplService = DeeplService(deeplApiKey);

    setState(() {
      _deeplTranslationAnswerFuture =
          deeplService.translate(DeeplTranslationRequest(
        text: [widget.searchText],
        sourceLang: widget.sourceLang,
        targetLang: widget.targetLang,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: _deeplTranslationAnswerFuture,
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return Container();
            }
            DeeplTranslationAnswer deeplTranslationAnswer = snapshot.data;

            return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: kPadding),
                shrinkWrap: true,
                physics: widget.suggestionScrollPhysics,
                itemCount: deeplTranslationAnswer.translations.length,
                itemBuilder: (context, index) {
                  DeeplTranslation translation =
                      deeplTranslationAnswer.translations[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: kPadding),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      onTap: () {
                        widget.onTranslationClicked(
                          ApiTranslation.fromDeepl(translation),
                        );
                      },
                      title: Text(translation.text),
                      // subtitle: Text(''),
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
