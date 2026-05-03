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
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'Enter your text';

  @override
  String get label_text2 => 'How many times to repeat the text?';

  @override
  String get checkbox_title => 'Create new line';

  @override
  String get elevated_btn_generate => 'Generate Text';

  @override
  String get elevated_btn_reset => 'Reset';

  @override
  String get tooltip_copy => 'Copy';

  @override
  String get tooltip_share => 'Share';

  @override
  String get snackbar_text => 'Text copied to clipboard!';

  @override
  String get snackbar_empty_text => 'Nothing to copy or share';

  @override
  String max_limit_text(Object max) {
    return 'Up to $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'What you\'ll get:';

  @override
  String get premium_feature_no_ads => 'Complete removal of all ads';

  @override
  String get premium_feature_unlimited => 'Up to 100,000 repetitions at once';

  @override
  String get premium_feature_support => 'Priority support';

  @override
  String get premium_one_time => 'One-time purchase — forever!';

  @override
  String get premium_button_buy => 'Buy PRO — \$3.99';

  @override
  String get premium_button_later => 'Later';

  @override
  String get share_file_name => 'repeated_text';

  @override
  String get share_too_large =>
      'Text is too large for direct sharing.\nUse \"Copy\" instead.';

  @override
  String get share_error => 'Failed to share';

  @override
  String copy_limit_exceeded(Object max) {
    return 'Copying is available only up to $max lines.\nUse \"Share\" for larger texts.';
  }

  @override
  String get copy_too_large => 'Failed to copy text';

  @override
  String get limit_free => 'Up to 2000';

  @override
  String get limit_premium => 'Up to 100000';

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
        'fr': 'French',
        'es': 'Spanish',
        'de': 'German',
        'id': 'Indonesian',
        'ko': 'Korean',
        'pt': 'Portuguese',
        'ru': 'Russian',
        'ja': 'Japanese',
        'other': 'Unknown',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'repetitions of text';

  @override
  String get purchase_next_update =>
      'Purchase will be available in the next update.';

  @override
  String get no_items => 'No items';
}
