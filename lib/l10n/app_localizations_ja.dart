// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get main_title => 'テキストを追加、繰り返し、コピー、共有！';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'テキストを入力';

  @override
  String get label_text2 => 'テキストを何回繰り返しますか？';

  @override
  String get checkbox_title => '新しい行を作成';

  @override
  String get elevated_btn_generate => 'テキストを生成';

  @override
  String get elevated_btn_reset => 'リセット';

  @override
  String get tooltip_copy => 'コピー';

  @override
  String get tooltip_share => '共有';

  @override
  String get snackbar_text => 'テキストをクリップボードにコピーしました！';

  @override
  String get snackbar_empty_text => 'コピーまたは共有するものがありません';

  @override
  String max_limit_text(Object max) {
    return '最大 $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => '得られる機能：';

  @override
  String get premium_feature_no_ads => 'すべての広告を完全に削除';

  @override
  String get premium_feature_unlimited => '一度に最大100,000回繰り返し';

  @override
  String get premium_feature_support => '優先サポート';

  @override
  String get premium_one_time => '一度の購入で永久に！';

  @override
  String get premium_button_buy => 'PROを購入 — \$3.99';

  @override
  String get premium_button_later => '後で';

  @override
  String get share_file_name => 'repeated_text';

  @override
  String get share_too_large => 'テキストが長すぎて直接共有できません。\n代わりに「コピー」を使用してください。';

  @override
  String get share_error => '共有に失敗しました';

  @override
  String copy_limit_exceeded(Object max) {
    return '$max行までしかコピーできません。\n長いテキストは「共有」を使用してください。';
  }

  @override
  String get copy_too_large => 'テキストのコピーに失敗しました';

  @override
  String get limit_free => '最大2000';

  @override
  String get limit_premium => '最大100000';

  @override
  String get drawer_header => 'Text Repeater アプリ';

  @override
  String get drawer_title_rate => 'このアプリを評価';

  @override
  String get drawer_title_privacy => 'プライバシーポリシー';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': '英語',
        'fr': 'フランス語',
        'es': 'スペイン語',
        'de': 'ドイツ語',
        'id': 'インドネシア語',
        'ko': '韓国語',
        'pt': 'ポルトガル語',
        'ru': 'ロシア語',
        'ja': '日本語',
        'other': 'その他',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => '回のテキスト繰り返し';

  @override
  String get purchase_next_update => '購入は次のアップデートで利用可能になります。';

  @override
  String get no_items => '項目なし';
}
