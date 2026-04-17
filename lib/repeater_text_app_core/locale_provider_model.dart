import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_repeater/generated/l10n.dart';

final localeProvider = ChangeNotifierProvider<LocaleModelProvider>(
    (ref) => LocaleModelProvider());

class LocaleModelProvider extends ChangeNotifier {
  //Locale _locale = const Locale("en");
  Locale? _locale;
  Locale? get locale => _locale;
  void setLocaleLanguage(Locale locale) {
    if (!S.delegate.supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
