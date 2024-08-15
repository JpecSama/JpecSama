import 'package:flutter/material.dart';
import 'package:kana_romaji_translator/japanese_text_translator.dart';

class JapaneseTextEditingController extends TextEditingController {
  final JapaneseTextTranslator _japaneseTextTranslator =
      JapaneseTextTranslator();

  String _japanese = '';
  bool _isTranslating = true;

  String get japanese => _japanese;
  bool get isTranslatingToJapanese => _isTranslating;

  JapaneseTextEditingController() {
    addListener(_translateText);
  }

  void activateTranslating() {
    _isTranslating = true;
  }

  void deactivateTranslating() {
    _isTranslating = false;
  }

  void _translateText() {
    _japanese = _japaneseTextTranslator.getJapaneseTranslation(text);
  }

  @override
  void dispose() {
    removeListener(_translateText);
    super.dispose();
  }
}
