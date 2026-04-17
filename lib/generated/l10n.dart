// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Add Text, Repeat, Copy and Share!`
  String get main_title {
    return Intl.message(
      'Add Text, Repeat, Copy and Share!',
      name: 'main_title',
      desc: '',
      args: [],
    );
  }

  /// `Add Text, Repeat, Copy and Share!`
  String get app_title {
    return Intl.message(
      'Add Text, Repeat, Copy and Share!',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Text copied`
  String get snackbar_text {
    return Intl.message(
      'Text copied',
      name: 'snackbar_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter your text`
  String get label_text1 {
    return Intl.message(
      'Enter your text',
      name: 'label_text1',
      desc: '',
      args: [],
    );
  }

  /// `How many times repeat the text?`
  String get label_text2 {
    return Intl.message(
      'How many times repeat the text?',
      name: 'label_text2',
      desc: '',
      args: [],
    );
  }

  /// `Create new line`
  String get checkbox_title {
    return Intl.message(
      'Create new line',
      name: 'checkbox_title',
      desc: '',
      args: [],
    );
  }

  /// `max 1000 lines`
  String get text_max1000 {
    return Intl.message(
      'max 1000 lines',
      name: 'text_max1000',
      desc: '',
      args: [],
    );
  }

  /// `Generate Text`
  String get elevated_btn_generate {
    return Intl.message(
      'Generate Text',
      name: 'elevated_btn_generate',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get elevated_btn_reset {
    return Intl.message(
      'Reset',
      name: 'elevated_btn_reset',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get tooltip_copy {
    return Intl.message('Copy', name: 'tooltip_copy', desc: '', args: []);
  }

  /// `Share`
  String get tooltip_share {
    return Intl.message('Share', name: 'tooltip_share', desc: '', args: []);
  }

  /// `Text repeater app`
  String get drawer_header {
    return Intl.message(
      'Text repeater app',
      name: 'drawer_header',
      desc: '',
      args: [],
    );
  }

  /// `Rate this app`
  String get drawer_title_rate {
    return Intl.message(
      'Rate this app',
      name: 'drawer_title_rate',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get drawer_title_privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'drawer_title_privacy',
      desc: '',
      args: [],
    );
  }

  /// `{locale, select, en {English} fr {Français} es {Español} de {Deutsch} id {Bahasa\nIndonesia} ko {한국어} ms {Melayu} pt {Português} ru {Русский} ja {日本語} other {-}}`
  String pageSettingsInputLanguage(String locale) {
    return Intl.select(
      locale,
      {
        'en': 'English',
        'fr': 'Français',
        'es': 'Español',
        'de': 'Deutsch',
        'id': 'Bahasa\nIndonesia',
        'ko': '한국어',
        'ms': 'Melayu',
        'pt': 'Português',
        'ru': 'Русский',
        'ja': '日本語',
        'other': '-',
      },
      name: 'pageSettingsInputLanguage',
      desc: '',
      args: [locale],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'de', countryCode: 'DE'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'ES'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'id', countryCode: 'ID'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'ko', countryCode: 'KR'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'PT'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
