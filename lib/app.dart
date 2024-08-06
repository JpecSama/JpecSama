import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'theme/custom_bottom_nav_bar/bloc/custom_nav_bar_bloc.dart';
import 'theme/custom_theme.dart';
/*
Thème: Langue Maternelle => Langue étrangère 
Version: Langue étrangère => Langue Maternelle
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomNavBarBloc>(
          create: (context) => CustomNavBarBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: 'JpecSama',
        localizationsDelegates: const [
          ...AppLocalizations.localizationsDelegates
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        // theme: themeData,
        theme: japaneseTheme,
        routerConfig: router,
      ),
    );
  }
}
