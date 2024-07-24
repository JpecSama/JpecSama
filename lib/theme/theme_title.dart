import 'package:flutter/material.dart';
import 'package:jpec_sama/extensions/context_extension.dart';

class ThemeTitle extends StatelessWidget {
  const ThemeTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleMedium,
    );
  }
}
