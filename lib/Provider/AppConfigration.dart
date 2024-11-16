import 'package:flutter/material.dart';

class AppLanguageNotifier extends ChangeNotifier {
  String selectedLanguage = 'en';

  // ThemeData? selectedTheme = AppTheme.lightTheme;
  ThemeMode selectedTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (selectedLanguage == newLanguage) {
      return;
    }
    selectedLanguage = newLanguage;
    notifyListeners();
  }

  void changeAppTheme(ThemeMode newTheme) {
    if (selectedTheme == newTheme) return;
    selectedTheme = newTheme;
    notifyListeners();
  }
// void changeAppTheme(ThemeData theme) {
//   if (selectedTheme == theme) {
//     return;
//   }
//   selectedTheme = theme;
//   notifyListeners();
// }
}
