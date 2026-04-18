// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get main_title => 'Ajouter du texte, répéter, copier et partager!';

  @override
  String get app_title => 'Ajouter du texte, répéter, copier et partager!';

  @override
  String get snackbar_text => 'Texte copié';

  @override
  String get label_text1 => 'Entrez votre texte';

  @override
  String get label_text2 => 'Combien de fois répéter le texte?';

  @override
  String get checkbox_title => 'Créer une nouvelle ligne';

  @override
  String get text_max1000 => '2000 lignes maximum';

  @override
  String get elevated_btn_generate => 'Générer du texte';

  @override
  String get elevated_btn_reset => 'Reset';

  @override
  String get tooltip_copy => 'Copier';

  @override
  String get tooltip_share => 'Partager';

  @override
  String get drawer_header => 'Text repeater app';

  @override
  String get drawer_title_rate => 'Notez cette application';

  @override
  String get drawer_title_privacy => 'Politique de confidentialité';

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
