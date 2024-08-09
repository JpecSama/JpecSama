import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpec_sama/services/notification_service.dart';

import 'controller/notification_controller.dart';
import 'theme/custom_bottom_nav_bar/bloc/custom_nav_bar_bloc.dart';
import 'theme/custom_theme.dart';
/*
Thème: Langue Maternelle => Langue étrangère 
Version: Langue étrangère => Langue Maternelle
*/

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        //FOREGROUND
        AwesomeNotifications().resetGlobalBadge();
        // AwesomeNotifications()
        //     .dismiss(57);
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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
