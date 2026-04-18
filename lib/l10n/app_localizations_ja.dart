// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get main_title => 'テキストを追加、リピート、コピー、共有！';

  @override
  String get app_title => 'テキストの追加、リピート、コピー、共有！';

  @override
  String get snackbar_text => 'コピーしたテキスト';

  @override
  String get label_text1 => 'テキストを入力';

  @override
  String get label_text2 => 'テキストを何回繰り返しますか？';

  @override
  String get checkbox_title => '新しい行を作成';

  @override
  String get text_max1000 => '最大2000行';

  @override
  String get elevated_btn_generate => 'テキストの生成';

  @override
  String get elevated_btn_reset => 'リセット';

  @override
  String get tooltip_copy => 'コピー';

  @override
  String get tooltip_share => '共有';

  @override
  String get drawer_header => 'テキストリピーターアプリ';

  @override
  String get drawer_title_rate => 'このアプリを評価する';

  @override
  String get drawer_title_privacy => 'プライバシーポリシー';

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
