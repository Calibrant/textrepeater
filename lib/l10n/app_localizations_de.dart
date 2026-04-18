// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get main_title => 'Wiederholer-Text';

  @override
  String get app_title => 'Add Text, Repeat, Copy and Share!';

  @override
  String get snackbar_text => 'Kopierter Text';

  @override
  String get label_text1 => 'Geben Sie Ihren Text ein';

  @override
  String get label_text2 => 'Wie oft soll der Text wiederholt werden?';

  @override
  String get checkbox_title => 'Neue Zeile erstellen';

  @override
  String get text_max1000 => 'max 2000 Zeilen';

  @override
  String get elevated_btn_generate => 'Text gener.';

  @override
  String get elevated_btn_reset => 'Zurücksetzen';

  @override
  String get tooltip_copy => 'Kopieren';

  @override
  String get tooltip_share => 'Teilen';

  @override
  String get drawer_header => 'Wiederholungstext';

  @override
  String get drawer_title_rate => 'Diese Anwendung bewerten';

  @override
  String get drawer_title_privacy => 'Datenschutzrichtlinie';

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
  String get snackbar_empty_text => 'There is nothing to copy';
}

/// The translations for German, as used in Germany (`de_DE`).
class AppLocalizationsDeDe extends AppLocalizationsDe {
  AppLocalizationsDeDe() : super('de_DE');

  @override
  String get main_title => 'Wiederholer-Text';

  @override
  String get snackbar_text => 'Kopierter Text';

  @override
  String get label_text1 => 'Geben Sie Ihren Text ein';

  @override
  String get label_text2 => 'Wie oft soll der Text wiederholt werden?';

  @override
  String get checkbox_title => 'Neue Zeile erstellen';

  @override
  String get text_max1000 => 'max 2000 Zeilen';

  @override
  String get elevated_btn_generate => 'Text generieren';

  @override
  String get elevated_btn_reset => 'Zurücksetzen';

  @override
  String get tooltip_copy => 'Kopieren';

  @override
  String get tooltip_share => 'Teilen';

  @override
  String get drawer_header => 'Wiederholungstext';

  @override
  String get drawer_title_rate => 'Diese Anwendung bewerten';

  @override
  String get drawer_title_privacy => 'Datenschutzrichtlinie';
}
