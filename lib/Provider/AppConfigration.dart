import 'package:flutter/material.dart';
import 'package:islami_app/Style/AppTheme.dart';

class AppLanguageNotifier extends ChangeNotifier {
  String selectedLanguage = 'en';
  ThemeData? selectedTheme = AppTheme.lightTheme;

  void changeLanguage(String newLanguage) {
    if (selectedLanguage == newLanguage) {
      return;
    }
    selectedLanguage = newLanguage;
    notifyListeners();
  }

  void changeAppTheme(ThemeData theme) {
    if (selectedTheme == theme) {
      return;
    }
    selectedTheme = theme;
    notifyListeners();
  }
}
