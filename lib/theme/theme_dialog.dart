import 'package:flutter/material.dart';
import 'package:jpec_sama/constants.dart';

class ThemeDialog extends StatelessWidget {
  const ThemeDialog({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 2 * kPadding,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
