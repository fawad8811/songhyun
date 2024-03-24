import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('en', 'US');

  Locale get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.toString());
  }

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString('locale');

    if (savedLocale != null) {
      _locale = Locale(savedLocale.split('_')[0], savedLocale.split('_')[1]);
    }

    notifyListeners();
  }

  void toggleLocale() async {
    if (_locale.languageCode == 'en') {
      await setLocale(const Locale('ko', 'KR'));
    } else {
      await setLocale(const Locale('en', 'US'));
    }
    notifyListeners();
  }
}
