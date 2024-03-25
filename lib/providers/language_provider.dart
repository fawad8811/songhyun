import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
  }

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString('locale');

    if (savedLocale != null) {
      _locale = Locale(savedLocale);
    }

    notifyListeners();
  }

  void toggleLocale() async {
    if (_locale.languageCode == 'en') {
      await setLocale(const Locale('ko'));
    } else {
      await setLocale(const Locale('en'));
    }
    notifyListeners();
  }
}
