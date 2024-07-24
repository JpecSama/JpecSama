// import 'package:hive/hive.dart';

// class ThemeService {
//   static Future<CustomTheme> loadSavedTheme() async {
//     Box<CustomTheme> hiveBox = await Hive.openBox('settings');
//     return hiveBox.get('customTheme',
//             defaultValue: CustomTheme.waterFoamTheme()) ??
//         CustomTheme.waterFoamTheme();
//   }

//   static Future<void> saveTheme(CustomTheme theme) async {
//     Box<CustomTheme> hiveBox = await Hive.openBox('settings');
//     await hiveBox.put('customTheme', theme);
//   }
// }
