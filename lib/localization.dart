import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();

  late Map<String, dynamic> _localizedString;

  Future load() async {
    String jsonContent =
        await rootBundle.loadString("lang/${locale.languageCode}.json");
    _localizedString = json.decode(jsonContent);
  }

  String translate(String key) {
    var splitcontent = key.split('.');
    if (splitcontent.length == 1) {
      return _localizedString[key] ?? '$key not found';
    }
    dynamic json;
    for (var i = 0; i < splitcontent.length - 1; i++) {
      json = _localizedString[splitcontent[i]];
    }
    return json[splitcontent.last] ?? '$key not found';
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'sk'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = new AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
