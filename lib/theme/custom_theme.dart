import 'package:flutter/material.dart';

class CustomTheme {
//https://color-term.com/traditional-color-of-japan/
//https://en.wikipedia.org/wiki/Traditional_colors_of_Japan
// Red/violet series
  static const lightSakura = Color(0xFFfef4f4); // Sakura (cherry blossom)
  static const sakuraIro = Color.fromARGB(255, 252, 210, 198);
  static const nakabeni = Color(0xffC93756); // Medium crimson
  static const momoIro = Color(0xffF47983); // Peach-colored
  static const tonocha = Color(0xff5A6457);
// Red series
  static const ebicha = Color(0xFFb5495b);
  static const akabeni = Color(0xFFC3272B);
  static const edocha = Color(0xffA13D2D);

// Yellow/Red
  static const shiracha = Color(0xffC48E69);
  static const torinoko = Color(0xffE2BE9F);
  static const mushikuri = Color(0xffD3B17D);

  static const aimirucha = Color(0xff2E372E);
  static const mizuasagi = Color(0xff749F8D);
  static const hanasagi = Color(0xff1D697C);
  static const aotake = Color(0xffC6C2B6); // https://nipponcolors.com/#aotake
  static const kamenozoki = Color(0xffC6C2B6);

// Achromatic series
  static const shironeri = Color(0xffFFDDCA); // Unbleached silk
  static const sumiIro = Color(0xff27221F); // Ink color
  static const sumiIroLight = Color.fromARGB(177, 39, 34, 31); // Ink color
  static const kokushoku = Color(0xff171412); //Black
  static const kurotobi = Color(0xff351E1C);

  static ThemeData defaultTheme = ThemeData(
    useMaterial3: true,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.black),
        side: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(
                color: sumiIroLight,
              );
            }
            return BorderSide(
              color: sumiIro,
            );
          },
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      trackOutlineColor: WidgetStateProperty.resolveWith(
        (_) => sumiIro,
      ),
      thumbColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(
            WidgetState.selected,
          )) {
            return momoIro;
          }
          return sumiIro;
        },
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(
            WidgetState.selected,
          )) {
            return momoIro.withAlpha(100);
          }
          return sumiIro.withAlpha(100);
        },
      ),
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      color: sumiIro,
      selectedColor: mizuasagi,
      fillColor: mizuasagi,
      selectedBorderColor: sumiIro,
      borderRadius: BorderRadius.circular(5),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
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
      primary: lightSakura, // Sakura (cherry blossom)
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
    scaffoldBackgroundColor: lightSakura, // Sakura
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
      headlineLarge: TextStyle(color: sumiIro), // Ebicha
      headlineMedium: TextStyle(color: sumiIro), // Aonibi
      headlineSmall: TextStyle(color: sumiIro), // Ebicha
      //
      titleLarge: TextStyle(color: sumiIro),
      titleMedium: TextStyle(color: sumiIro),
      titleSmall: TextStyle(color: sumiIro),
      //
      // bodyMedium: TextStyle(color: Color(0xFF26453D)), // Aonibi
      bodyLarge: TextStyle(color: sumiIro),
      bodyMedium: TextStyle(color: sumiIro),
      bodySmall: TextStyle(color: sumiIro),
      //
      labelMedium: TextStyle(color: sumiIro),
      labelSmall: TextStyle(color: sumiIro),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.black),
      ),
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
      backgroundColor: CustomTheme.shironeri,
      titleTextStyle: TextStyle(
        color: sumiIro,
        fontSize: 20,
      ), // Ebichanibi
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
}
