import 'package:flutter/material.dart';
import 'package:jpec_sama/router.dart';

import 'custom_theme.dart';
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
      theme: themeData,
      routerConfig: router,
    );
  }
}
