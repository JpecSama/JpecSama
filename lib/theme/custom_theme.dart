import 'package:flutter/material.dart';

//https://en.wikipedia.org/wiki/Traditional_colors_of_Japan
// Red/violet series
const nakabeni = Color(0xffC93756); // Medium crimson
const momoIro = Color(0xffF47983); // Peach-colored
const ebicha = Color(0xFFb5495b);
// Achromatic series
const shironeri = Color(0xffFFDDCA); // Unbleached silk
const sumiIro = Color(0xff27221F); // Ink color
const kokushoku = Color(0xff171412); //Black

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

final ThemeData japaneseTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFfef4f4), // Sakura (cherry blossom)
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFFfedfe1), // Momoiro (peach)
    onSecondary: Color(0xFF000000),
    surface: Color(0xFFe5abbe), // Suō (pale red)
    onSurface: Color(0xFF000000),
    // background: Color(0xFFfef4f4), // Sakura
    // onBackground: Color(0xFF000000),
    error: Color(0xFFb5495b), // Ebicha (shrimp brown)
    onError: Color(0xFFFFFFFF),
    outline: Color(0xFF6a8372), // Usuao (light grayish blue)
    // surfaceVariant: Color(0xFFfef4f4), // Sakura
    onSurfaceVariant: Color(0xFF000000),
    tertiary: Color(0xFF9e7b56), // Akakō (dark yellowish-brown)
    onTertiary: Color(0xFFFFFFFF),
  ),
  scaffoldBackgroundColor: const Color(0xFFfef4f4), // Sakura
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF26453D), // Aonibi
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Color(0xFF26453D)), // Aonibi
    bodyLarge: TextStyle(color: Color(0xFF26453D)), // Aonibi
    titleLarge: TextStyle(color: Color(0xFFb5495b)), // Ebicha
    titleMedium: TextStyle(color: Color(0xFF9e7b56)), // Akakō
    titleSmall: TextStyle(color: Color(0xFF26453D)), // Aonibi
    headlineLarge: TextStyle(color: Color(0xFFb5495b)), // Ebicha
    headlineMedium: TextStyle(color: Color(0xFF26453D)), // Aonibi
    headlineSmall: TextStyle(color: Color(0xFFb5495b)), // Ebicha
    labelMedium: TextStyle(color: Color(0xFF6a8372)), // Usuao
    labelSmall: TextStyle(color: Color(0xFFFFFFFF)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ebicha,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFb5495b), // Ebicha
    textTheme: ButtonTextTheme.primary,
  ),
  iconTheme: const IconThemeData(color: Color(0xFF26453D)), // Aonibi
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFfedfe1), // Momoiro
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF6a8372)), // Usuao
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFb5495b),
      ), // Ebicha
    ),
    labelStyle: TextStyle(color: Color(0xFF26453D)), // Aonibi
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFb5495b), // Ebicha
  ),
  cardTheme: const CardTheme(
    color: sumiIro,
    shadowColor: Color(0xFF9e7b56), // Akakō
    elevation: 5,
    margin: EdgeInsets.all(10),
  ),
  dividerColor: const Color(0xFF6a8372), // Usuao
  popupMenuTheme: const PopupMenuThemeData(
    color: Color(0xFFfedfe1), // Momoiro
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFFfef4f4), // Sakura
    titleTextStyle: TextStyle(color: Color(0xFFb5495b), fontSize: 20), // Ebicha
    contentTextStyle: TextStyle(color: Color(0xFF26453D)), // Aonibi
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF26453D), // Aonibi
    selectedItemColor: Color(0xFFb5495b), // Ebicha
    unselectedItemColor: Color(0xFF6a8372), // Usuao
  ),
  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      // color: const Color(0xFF9e7b56), // Akakō
      borderRadius: BorderRadius.circular(5),
    ),
    textStyle: const TextStyle(color: Color(0xFFFFFFFF)),
  ),
  listTileTheme: const ListTileThemeData(
    textColor: sumiIro,
    tileColor: null,
    iconColor: sumiIro,
  ),
);
