import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(this).colorScheme.error
            : Theme.of(this).snackBarTheme.backgroundColor,
      ),
    );
  }

  // https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
  AppLocalizations get translations => AppLocalizations.of(this)!;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
