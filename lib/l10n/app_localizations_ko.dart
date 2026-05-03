// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get main_title => '텍스트 추가, 반복, 복사 및 공유!';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => '텍스트 입력';

  @override
  String get label_text2 => '텍스트를 몇 번 반복할까요?';

  @override
  String get checkbox_title => '새 줄 만들기';

  @override
  String get elevated_btn_generate => '텍스트 생성';

  @override
  String get elevated_btn_reset => '초기화';

  @override
  String get tooltip_copy => '복사';

  @override
  String get tooltip_share => '공유';

  @override
  String get snackbar_text => '텍스트가 클립보드에 복사되었습니다!';

  @override
  String get snackbar_empty_text => '복사하거나 공유할 내용이 없습니다';

  @override
  String max_limit_text(Object max) {
    return '최대 $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => '얻게 될 기능:';

  @override
  String get premium_feature_no_ads => '모든 광고 완전 제거';

  @override
  String get premium_feature_unlimited => '한 번에 최대 100,000회 반복';

  @override
  String get premium_feature_support => '우선 지원';

  @override
  String get premium_one_time => '일회성 구매 — 영구적으로!';

  @override
  String get premium_button_buy => 'PRO 구매 — \$3.99';

  @override
  String get premium_button_later => '나중에';

  @override
  String get share_file_name => 'repeated_text';

  @override
  String get share_too_large => '텍스트가 너무 길어 직접 공유할 수 없습니다.\n\"복사\"를 사용하세요.';

  @override
  String get share_error => '공유 실패';

  @override
  String copy_limit_exceeded(Object max) {
    return '$max줄까지만 복사할 수 있습니다.\n더 긴 텍스트는 \"공유\"를 사용하세요.';
  }

  @override
  String get copy_too_large => '텍스트 복사 실패';

  @override
  String get limit_free => '최대 2000';

  @override
  String get limit_premium => '최대 100000';

  @override
  String get drawer_header => 'Text Repeater 앱';

  @override
  String get drawer_title_rate => '앱 평가하기';

  @override
  String get drawer_title_privacy => '개인정보 보호정책';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': '영어',
        'fr': '프랑스어',
        'es': '스페인어',
        'de': '독일어',
        'id': '인도네시아어',
        'ko': '한국어',
        'pt': '포르투갈어',
        'ru': '러시아어',
        'ja': '일본어',
        'other': '기타',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => '텍스트 반복';

  @override
  String get purchase_next_update => '구매는 다음 업데이트에서 가능합니다.';

  @override
  String get no_items => '항목 없음';
}

/// The translations for Korean, as used in Republic of Korea (`ko_KR`).
class AppLocalizationsKoKr extends AppLocalizationsKo {
  AppLocalizationsKoKr() : super('ko_KR');

  @override
  String get main_title => '텍스트 추가, 반복, 복사 및 공유!';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => '텍스트 입력';

  @override
  String get label_text2 => '텍스트를 몇 번 반복할까요?';

  @override
  String get checkbox_title => '새 줄 만들기';

  @override
  String get elevated_btn_generate => '텍스트 생성';

  @override
  String get elevated_btn_reset => '초기화';

  @override
  String get tooltip_copy => '복사';

  @override
  String get tooltip_share => '공유';

  @override
  String get snackbar_text => '텍스트가 클립보드에 복사되었습니다!';

  @override
  String get snackbar_empty_text => '복사하거나 공유할 내용이 없습니다';

  @override
  String max_limit_text(Object max) {
    return '최대 $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => '얻게 될 기능:';

  @override
  String get premium_feature_no_ads => '모든 광고 완전 제거';

  @override
  String get premium_feature_unlimited => '한 번에 최대 100,000회 반복';

  @override
  String get premium_feature_support => '우선 지원';

  @override
  String get premium_one_time => '일회성 구매 — 영구적으로!';

  @override
  String get premium_button_buy => 'PRO 구매 — \$3.99';

  @override
  String get premium_button_later => '나중에';

  @override
  String get share_file_name => 'repeated_text';

  @override
  String get share_too_large => '텍스트가 너무 길어 직접 공유할 수 없습니다.\n\"복사\"를 사용하세요.';

  @override
  String get share_error => '공유 실패';

  @override
  String copy_limit_exceeded(Object max) {
    return '$max줄까지만 복사할 수 있습니다.\n더 긴 텍스트는 \"공유\"를 사용하세요.';
  }

  @override
  String get copy_too_large => '텍스트 복사 실패';

  @override
  String get limit_free => '최대 2000';

  @override
  String get limit_premium => '최대 100000';

  @override
  String get drawer_header => 'Text Repeater 앱';

  @override
  String get drawer_title_rate => '앱 평가하기';

  @override
  String get drawer_title_privacy => '개인정보 보호정책';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': '영어',
        'fr': '프랑스어',
        'es': '스페인어',
        'de': '독일어',
        'id': '인도네시아어',
        'ko': '한국어',
        'pt': '포르투갈어',
        'ru': '러시아어',
        'ja': '일본어',
        'other': '기타',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => '텍스트 반복';

  @override
  String get purchase_next_update => '구매는 다음 업데이트에서 가능합니다.';

  @override
  String get no_items => '항목 없음';
}
