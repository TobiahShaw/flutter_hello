import 'dart:async';

import 'package:intl/intl.dart';
import 'messages_all.dart';
import 'package:flutter/material.dart';

// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/demo/i18n lib/demo/i18n/intl_localizations_demo.dart
// 生成对应的arb文件intl_message.arb，然后复制出zh和en

// flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=Tobiah_demo_ --output-dir=/lib/demo/i18n/ --no-use-deferred-loading lib/demo/i18n/intl_localizations_demo.dart lib/demo/i18n/intl/intl_*.arb
// 生成对应的dart文件
class TobiahDemoLocalizations {
  static TobiahDemoLocalizations of(BuildContext context) {
    return Localizations.of<TobiahDemoLocalizations>(
        context, TobiahDemoLocalizations);
  }

  static Future<TobiahDemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return TobiahDemoLocalizations();
    });
  }

  String get title =>
      Intl.message('hello', name: 'title', desc: 'demo localization');

  String greet(String name) => Intl.message(
        'hello $name',
        name: 'greet',
        desc: 'greet someone',
        args: [name],
      );
}

class TobiahDemoLocalizationsDelegate
    extends LocalizationsDelegate<TobiahDemoLocalizations> {
  TobiahDemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<TobiahDemoLocalizations> load(Locale locale) {
    return TobiahDemoLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<TobiahDemoLocalizations> old) {
    return false;
  }
}
