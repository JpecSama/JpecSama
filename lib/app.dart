import 'package:flutter/material.dart';
import 'package:jpec_sama/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'theme/custom_theme.dart';
/*
Thème: Langue Maternelle => Langue étrangère 
Version: Langue étrangère => Langue Maternelle
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'JpecSama',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // theme: themeData,
      theme: japaneseTheme,
      routerConfig: router,
    );
  }
}
