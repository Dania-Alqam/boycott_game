import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en'); // Default to Arabic

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('ar');
    notifyListeners();
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸';
      case 'ar':
        return '🇸🇦';
      default:
        return '🇺🇸';
    }
  }

  static String getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'ENG';
      case 'ar':
        return 'عربى';
      default:
        return '';
    }
  }
}
