import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TobiahDemoLocalizations {
  final Locale _locale;
  TobiahDemoLocalizations(this._locale);

  static TobiahDemoLocalizations of(BuildContext context) {
    return Localizations.of<TobiahDemoLocalizations>(context, TobiahDemoLocalizations);
  }

  static Map<String, Map<String, String>> _localize = {
    'en':{
      'title' : 'hello',
    },
    'zh':{
      'title' : '你好',
    },
  };

  String get title {
    return _localize[_locale.languageCode]['title'];
  }

  static bool support(Locale locale) {
    return _localize.containsKey(locale.languageCode);
  }
}

class TobiahDemoLocalizationsDelegate extends LocalizationsDelegate<TobiahDemoLocalizations> {

  TobiahDemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return TobiahDemoLocalizations.support(locale);
  }

  @override
  Future<TobiahDemoLocalizations> load(Locale locale) {
    return SynchronousFuture<TobiahDemoLocalizations>(TobiahDemoLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<TobiahDemoLocalizations> old) {
    return false;
  }

}