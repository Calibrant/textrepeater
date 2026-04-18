// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get main_title => '리피터 텍스트';

  @override
  String get app_title => '반복 텍스트';

  @override
  String get snackbar_text => '복사된 텍스트';

  @override
  String get label_text1 => '텍스트 입력';

  @override
  String get label_text2 => '텍스트를 몇 번 반복합니까?';

  @override
  String get checkbox_title => '새 줄 만들기';

  @override
  String get text_max1000 => '최대 2000줄';

  @override
  String get elevated_btn_generate => '텍스트 생성';

  @override
  String get elevated_btn_reset => 'Reset';

  @override
  String get tooltip_copy => '복사';

  @override
  String get tooltip_share => '공유';

  @override
  String get drawer_header => '리피터 텍스트';

  @override
  String get drawer_title_rate => '이 앱 평가';

  @override
  String get drawer_title_privacy => '개인정보 보호정책';

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

/// The translations for Korean, as used in Republic of Korea (`ko_KR`).
class AppLocalizationsKoKr extends AppLocalizationsKo {
  AppLocalizationsKoKr() : super('ko_KR');

  @override
  String get main_title => '리피터 텍스트';

  @override
  String get app_title => '반복 텍스트';

  @override
  String get snackbar_text => '복사된 텍스트';

  @override
  String get label_text1 => '텍스트 입력';

  @override
  String get label_text2 => '텍스트를 몇 번 반복합니까?';

  @override
  String get checkbox_title => '새 줄 만들기';

  @override
  String get text_max1000 => '최대 2000줄';

  @override
  String get elevated_btn_generate => '텍스트 생성';

  @override
  String get tooltip_copy => '복사';

  @override
  String get tooltip_share => '공유';

  @override
  String get drawer_header => '리피터 텍스트';

  @override
  String get drawer_title_rate => '이 앱 평가';

  @override
  String get drawer_title_privacy => '개인정보 보호정책';
}
