import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

const List<Locale> supportedLocales = [
  Locale('en', 'US'),
  Locale('zh', 'TW'),
];

class AppLocalizations {
  late Map<String, dynamic> _localizedStrings;

  BehaviorSubject<Locale> currentLocaleSubject =
      BehaviorSubject<Locale>.seeded(const Locale('zh', 'TW'));

  static final AppLocalizations _instance = AppLocalizations._internal();

  factory AppLocalizations() {
    return _instance;
  }

  AppLocalizations._internal();

  Future<void> load(Locale locale) async {
    final String jsonString = await rootBundle.loadString(
        'lib/l10n/${locale.languageCode}_${locale.countryCode}.arb');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    _instance._localizedStrings = jsonMap;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? '';
  }

  void setLocal(Locale locale) {
    currentLocaleSubject.add(locale);
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    await AppLocalizations().load(locale);
    return AppLocalizations();
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
