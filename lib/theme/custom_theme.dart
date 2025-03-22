import 'package:flutter/material.dart';

//https://color-term.com/traditional-color-of-japan/
//https://en.wikipedia.org/wiki/Traditional_colors_of_Japan
// Red/violet series
const sakuraIro = Color.fromARGB(255, 252, 210, 198);
const nakabeni = Color(0xffC93756); // Medium crimson
const momoIro = Color(0xffF47983); // Peach-colored
const tonocha = Color(0xff5A6457);
// Red series
const ebicha = Color(0xFFb5495b);
const akabeni = Color(0xFFC3272B);
const edocha = Color(0xffA13D2D);

// Yellow/Red
const shiracha = Color(0xffC48E69);
const torinoko = Color(0xffE2BE9F);
const mushikuri = Color(0xffD3B17D);

const aimirucha = Color(0xff2E372E);
const mizuasagi = Color(0xff749F8D);
const hanasagi = Color(0xff1D697C);
const aotake = Color(0xffC6C2B6); // https://nipponcolors.com/#aotake
const kamenozoki = Color(0xffC6C2B6);

// Achromatic series
const shironeri = Color(0xffFFDDCA); // Unbleached silk
const sumiIro = Color(0xff27221F); // Ink color
const sumiIroLight = Color.fromARGB(177, 39, 34, 31); // Ink color
const kokushoku = Color(0xff171412); //Black
const kurotobi = Color(0xff351E1C);

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);

final ThemeData japaneseTheme = ThemeData(
  useMaterial3: true,
  unselectedWidgetColor: sumiIro,
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(
      width: 1,
      color: sumiIro,
    ),
    fillColor: WidgetStateProperty.resolveWith(
      (_) => Colors.white,
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFfef4f4), // Sakura (cherry blossom)
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFFfedfe1), // Momoiro (peach)
    onSecondary: Color(0xFF000000),
    surface: Color(0xFFe5abbe), // Suō (pale red)
    onSurface: Color(0xFF000000),
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
    backgroundColor: momoIro, // Aonibi
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: ebicha,
    labelColor: ebicha,
    unselectedLabelColor: sumiIro,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(color: tonocha), // Ebicha
    headlineMedium: TextStyle(color: tonocha), // Aonibi
    headlineSmall: TextStyle(color: tonocha), // Ebicha
    //
    titleLarge: TextStyle(color: tonocha),
    titleMedium: TextStyle(color: tonocha),
    titleSmall: TextStyle(color: tonocha),
    //
    // bodyMedium: TextStyle(color: Color(0xFF26453D)), // Aonibi
    bodyLarge: TextStyle(color: sumiIro),
    bodyMedium: TextStyle(color: sumiIro),
    bodySmall: TextStyle(color: sumiIro),
    //
    labelMedium: TextStyle(color: sumiIroLight),
    labelSmall: TextStyle(color: sumiIroLight),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: mizuasagi,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: mizuasagi,
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
    backgroundColor: mizuasagi,
    foregroundColor: Colors.white,
  ),
  cardTheme: const CardTheme(
    color: sakuraIro,
    // shadowColor: Color(0xFF9e7b56), // Akakō
    elevation: 5,
    margin: EdgeInsets.symmetric(vertical: 8.0),
  ),
  dividerColor: const Color(0xFF6a8372), // Usuao
  popupMenuTheme: const PopupMenuThemeData(
    color: Color(0xFFfedfe1), // Momoiro
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: mizuasagi,
    titleTextStyle: TextStyle(
      color: ebicha,
      fontSize: 20,
    ), // Ebicha
    // contentTextStyle: TextStyle(
    //   color: Color(0xFF26453D),
    // ), // Aonibi
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: momoIro,
    selectedItemColor: sakuraIro,
    unselectedItemColor: sumiIro, // Usuao
  ),
  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      // color: const Color(0xFF9e7b56), // Akakō
      borderRadius: BorderRadius.circular(5),
    ),
    textStyle: const TextStyle(color: sumiIro),
  ),

  listTileTheme: const ListTileThemeData(
    textColor: sumiIro,
    tileColor: null,
    iconColor: sumiIro,
    minVerticalPadding: 8,
    // shape: RoundedRectangleBorder(
    //   side: const BorderSide(color: Colors.black, width: 1),
    //   borderRadius: BorderRadius.circular(5),
    // ),
  ),
);
final ThemeData customTheme = ThemeData(
  useMaterial3: true,
  unselectedWidgetColor: sumiIro,
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(
      width: 1,
      color: sumiIro,
    ),
    fillColor: WidgetStateProperty.resolveWith(
      (_) => Colors.white,
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFfef4f4), // Sakura (cherry blossom)
    onPrimary: Color(0xFF000000),
    secondary: Color(0xFFfedfe1), // Momoiro (peach)
    onSecondary: Color(0xFF000000),
    surface: Color(0xFFe5abbe), // Suō (pale red)
    onSurface: Color(0xFF000000),
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
    backgroundColor: momoIro, // Aonibi
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    titleTextStyle: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: ebicha,
    labelColor: ebicha,
    unselectedLabelColor: sumiIro,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(color: tonocha), // Ebicha
    headlineMedium: TextStyle(color: tonocha), // Aonibi
    headlineSmall: TextStyle(color: tonocha), // Ebicha
    //
    titleLarge: TextStyle(color: tonocha),
    titleMedium: TextStyle(color: tonocha),
    titleSmall: TextStyle(color: tonocha),
    //
    // bodyMedium: TextStyle(color: Color(0xFF26453D)), // Aonibi
    bodyLarge: TextStyle(color: sumiIro),
    bodyMedium: TextStyle(color: sumiIro),
    bodySmall: TextStyle(color: sumiIro),
    //
    labelMedium: TextStyle(color: sumiIroLight),
    labelSmall: TextStyle(color: sumiIroLight),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: mizuasagi,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: mizuasagi,
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
    backgroundColor: mizuasagi,
    foregroundColor: Colors.white,
  ),
  cardTheme: const CardTheme(
    color: sakuraIro,
    // shadowColor: Color(0xFF9e7b56), // Akakō
    elevation: 5,
    margin: EdgeInsets.symmetric(vertical: 8.0),
  ),
  dividerColor: const Color(0xFF6a8372), // Usuao
  popupMenuTheme: const PopupMenuThemeData(
    color: Color(0xFFfedfe1), // Momoiro
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: mizuasagi,
    titleTextStyle: TextStyle(
      color: ebicha,
      fontSize: 20,
    ), // Ebicha
    // contentTextStyle: TextStyle(
    //   color: Color(0xFF26453D),
    // ), // Aonibi
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: momoIro,
    selectedItemColor: sakuraIro,
    unselectedItemColor: sumiIro, // Usuao
  ),
  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      // color: const Color(0xFF9e7b56), // Akakō
      borderRadius: BorderRadius.circular(5),
    ),
    textStyle: const TextStyle(color: sumiIro),
  ),

  listTileTheme: const ListTileThemeData(
    textColor: sumiIro,
    tileColor: null,
    iconColor: sumiIro,
    minVerticalPadding: 8,
    // shape: RoundedRectangleBorder(
    //   side: const BorderSide(color: Colors.black, width: 1),
    //   borderRadius: BorderRadius.circular(5),
    // ),
  ),
);
