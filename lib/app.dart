// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpec_sama/theme/bloc/custom_theme_bloc.dart';
import 'theme/custom_bottom_nav_bar/bloc/custom_nav_bar_bloc.dart';
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
        BlocProvider<CustomThemeBloc>(
          create: (context) => CustomThemeBloc(),
        ),
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomThemeBloc, CustomThemeState>(
      buildWhen: (previous, current) => previous.themeData != current.themeData,
      builder: (context, state) {
        return MaterialApp.router(
          title: 'JpecSama',
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          theme: state.themeData,
          routerConfig: router,
        );
      },
    );
  }
}
