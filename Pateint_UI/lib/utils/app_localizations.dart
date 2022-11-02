import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations();

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
            context, AppLocalizations) ??
        AppLocalizations();
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String>? _localizedStrings;
  String? selectedLanguageCode;

  Future<bool> load(Locale locale) async {
    // Load the language JSON file from the "i18n" folder
    selectedLanguageCode = locale.languageCode;
    String jsonString =
        await rootBundle.loadString('assets/i18n/$selectedLanguageCode.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key, {Map<String, String>? arguments}) {
    String translation = _localizedStrings![key] ?? '';
    if (arguments == null || arguments.isEmpty) {
      return translation;
    }
    arguments.forEach((argumentKey, value) {
      if (value.isEmpty) {
        debugPrint(
            'Value for "$argumentKey" is null in call of translate(\'$key\')');
        value = '';
      }
      translation = translation.replaceAll("\$$argumentKey", value);
    });
    return translation;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en','hi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalization class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations();
    await localizations.load(locale);
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
