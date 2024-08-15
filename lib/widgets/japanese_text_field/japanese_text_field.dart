import 'package:flutter/material.dart';
import 'package:jpec_sama/extensions/context_extension.dart';

import 'controller/japanese_text_editing_controller.dart';

class JapaneseTextField extends StatefulWidget {
  const JapaneseTextField({super.key});

  @override
  State<JapaneseTextField> createState() => _JapaneseTextFieldState();
}

class _JapaneseTextFieldState extends State<JapaneseTextField> {
  late JapaneseTextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = JapaneseTextEditingController();
    _controller.addListener(() {
      setState(() {});
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
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {
                if (_controller.isTranslatingToJapanese) {
                  _controller.deactivateTranslating();
                } else {
                  _controller.activateTranslating();
                }
              },
              icon: const Icon(Icons.translate),
            ),
          ),
          controller: _controller,
        ),
        Text(
          _controller.japanese,
          style: context.textTheme.labelMedium!.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
