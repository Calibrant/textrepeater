import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_repeater/l10n/app_localizations.dart';

final localeProvider = ChangeNotifierProvider<LocaleModelProvider>(
    (ref) => LocaleModelProvider());

class LocaleModelProvider extends ChangeNotifier {
  //Locale _locale = const Locale("en");
  Locale? _locale;
  Locale? get locale => _locale;
  void setLocaleLanguage(Locale locale) {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
