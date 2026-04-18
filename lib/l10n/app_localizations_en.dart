// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get main_title => 'Add Text, Repeat, Copy and Share!';

  @override
  String get app_title => 'Add Text, Repeat, Copy and Share!';

  @override
  String get snackbar_text => 'Text copied';

  @override
  String get label_text1 => 'Enter your text';

  @override
  String get label_text2 => 'How many times repeat the text?';

  @override
  String get checkbox_title => 'Create new line';

  @override
  String get text_max1000 => 'max 2000 lines';

  @override
  String get elevated_btn_generate => 'Generate Text';

  @override
  String get elevated_btn_reset => 'Reset';

  @override
  String get tooltip_copy => 'Copy';

  @override
  String get tooltip_share => 'Share';

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
  String get snackbar_empty_text => 'There is nothing to copy';
}
