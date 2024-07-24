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
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en'),
      //   Locale('fr'),
      // ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: themeData,
      routerConfig: router,
    );
  }
}
