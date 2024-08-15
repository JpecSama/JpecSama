import 'package:flutter/material.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:kana_romaji_translator/japanese_text_translator.dart';

class JapaneseTextField extends StatefulWidget {
  const JapaneseTextField({super.key});

  @override
  State<JapaneseTextField> createState() => _JapaneseTextFieldState();
}

class _JapaneseTextFieldState extends State<JapaneseTextField> {
  final JapaneseTextTranslator _japaneseTextTranslator =
      JapaneseTextTranslator();
  late TextEditingController _controller;
  String _japanese = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      String text = _controller.text;
      setState(() {
        _japanese = _japaneseTextTranslator.getJapaneseTranslation(text);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
        ),
        Text(
          _japanese,
          style: context.textTheme.labelMedium!.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
