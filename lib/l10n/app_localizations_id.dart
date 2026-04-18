// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get main_title => 'Teks Pengulang';

  @override
  String get app_title => 'Ulangi Teks';

  @override
  String get snackbar_text => 'Teks disalin';

  @override
  String get label_text1 => 'Masukkan teks Anda';

  @override
  String get label_text2 => 'Berapa kali pengulangan teks?';

  @override
  String get checkbox_title => 'Buat baris baru';

  @override
  String get text_max1000 => 'maks 2000 baris';

  @override
  String get elevated_btn_generate => 'Buat Teks';

  @override
  String get elevated_btn_reset => 'Setel Ulang';

  @override
  String get tooltip_copy => 'Salin';

  @override
  String get tooltip_share => 'Bagikan';

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

/// The translations for Indonesian, as used in Indonesia (`id_ID`).
class AppLocalizationsIdId extends AppLocalizationsId {
  AppLocalizationsIdId() : super('id_ID');

  @override
  String get main_title => 'Teks Pengulang';

  @override
  String get app_title => 'Ulangi Teks';

  @override
  String get snackbar_text => 'Teks disalin';

  @override
  String get label_text1 => 'Masukkan teks Anda';

  @override
  String get label_text2 => 'Berapa kali pengulangan teks?';

  @override
  String get checkbox_title => 'Buat baris baru';

  @override
  String get text_max1000 => 'maks 2000 baris';

  @override
  String get elevated_btn_generate => 'Buat Teks';

  @override
  String get elevated_btn_reset => 'Setel Ulang';

  @override
  String get tooltip_copy => 'Salin';

  @override
  String get tooltip_share => 'Bagikan';
}
