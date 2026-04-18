// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get main_title => 'Повторяющийся Текст';

  @override
  String get app_title => 'Повторить Текст';

  @override
  String get snackbar_text => 'Текст скопирован';

  @override
  String get label_text1 => 'Введите текст';

  @override
  String get label_text2 => 'Сколько раз повторить текст?';

  @override
  String get checkbox_title => 'Повторять с новой строки';

  @override
  String get text_max1000 => 'До 2000 раз';

  @override
  String get elevated_btn_generate => 'Создать текст';

  @override
  String get elevated_btn_reset => 'Сброс';

  @override
  String get tooltip_copy => 'Копировать';

  @override
  String get tooltip_share => 'Поделиться';

  @override
  String get drawer_header => 'Text repeater app';

  @override
  String get drawer_title_rate => 'Rate this app';

  @override
  String get drawer_title_privacy => 'Privacy Policy';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
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
    );
    return '$_temp0';
  }

  @override
  String get snackbar_empty_text => 'Нечего копировать';
}

/// The translations for Russian, as used in Russian Federation (`ru_RU`).
class AppLocalizationsRuRu extends AppLocalizationsRu {
  AppLocalizationsRuRu() : super('ru_RU');

  @override
  String get main_title => 'Повторяющийся Текст';

  @override
  String get app_title => 'Повторить Текст';

  @override
  String get snackbar_text => 'Текст скопирован';

  @override
  String get label_text1 => 'Введите текст';

  @override
  String get label_text2 => 'Сколько раз повторить текст?';

  @override
  String get checkbox_title => 'Повторять с новой строки';

  @override
  String get text_max1000 => 'До 2000 раз';

  @override
  String get elevated_btn_generate => 'Создать текст';

  @override
  String get elevated_btn_reset => 'Сброс';

  @override
  String get tooltip_copy => 'Копировать';

  @override
  String get tooltip_share => 'Поделиться';
}
