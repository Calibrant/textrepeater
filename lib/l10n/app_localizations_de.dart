// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get main_title => 'Text hinzufügen, wiederholen, kopieren und teilen!';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'Gib deinen Text ein';

  @override
  String get label_text2 => 'Wie oft soll der Text wiederholt werden?';

  @override
  String get checkbox_title => 'Neue Zeile erstellen';

  @override
  String get elevated_btn_generate => 'Text generieren';

  @override
  String get elevated_btn_reset => 'Zurücksetzen';

  @override
  String get tooltip_copy => 'Kopieren';

  @override
  String get tooltip_share => 'Teilen';

  @override
  String get snackbar_text => 'Text in die Zwischenablage kopiert!';

  @override
  String get snackbar_empty_text => 'Nichts zum Kopieren oder Teilen';

  @override
  String max_limit_text(Object max) {
    return 'Bis zu $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'Was du erhältst:';

  @override
  String get premium_feature_no_ads => 'Vollständige Entfernung aller Werbung';

  @override
  String get premium_feature_unlimited =>
      'Bis zu 100.000 Wiederholungen auf einmal';

  @override
  String get premium_feature_support => 'Priorisierte Unterstützung';

  @override
  String get premium_one_time => 'Einmaliger Kauf — für immer!';

  @override
  String get premium_button_buy => 'PRO kaufen — 3,99 \$';

  @override
  String get premium_button_later => 'Später';

  @override
  String get share_file_name => 'wiederholter_text';

  @override
  String get share_too_large =>
      'Der Text ist zu groß zum direkten Teilen.\nVerwende stattdessen \"Kopieren\".';

  @override
  String get share_error => 'Teilen fehlgeschlagen';

  @override
  String copy_limit_exceeded(Object max) {
    return 'Kopieren ist nur bis zu $max Zeilen möglich.\nVerwende \"Teilen\" für längere Texte.';
  }

  @override
  String get copy_too_large => 'Text konnte nicht kopiert werden';

  @override
  String get limit_free => 'Bis zu 2000';

  @override
  String get limit_premium => 'Bis zu 100000';

  @override
  String get drawer_header => 'Text Repeater App';

  @override
  String get drawer_title_rate => 'App bewerten';

  @override
  String get drawer_title_privacy => 'Datenschutzerklärung';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Englisch',
        'fr': 'Französisch',
        'es': 'Spanisch',
        'de': 'Deutsch',
        'id': 'Indonesisch',
        'ko': 'Koreanisch',
        'pt': 'Portugiesisch',
        'ru': 'Russisch',
        'ja': 'Japanisch',
        'other': 'Unbekannt',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'Wiederholungen des Textes';

  @override
  String get purchase_next_update =>
      'Der Kauf wird im nächsten Update verfügbar sein.';

  @override
  String get no_items => 'Keine Einträge';
}

/// The translations for German, as used in Germany (`de_DE`).
class AppLocalizationsDeDe extends AppLocalizationsDe {
  AppLocalizationsDeDe() : super('de_DE');

  @override
  String get main_title => 'Text hinzufügen, wiederholen, kopieren und teilen!';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'Gib deinen Text ein';

  @override
  String get label_text2 => 'Wie oft soll der Text wiederholt werden?';

  @override
  String get checkbox_title => 'Neue Zeile erstellen';

  @override
  String get elevated_btn_generate => 'Text generieren';

  @override
  String get elevated_btn_reset => 'Zurücksetzen';

  @override
  String get tooltip_copy => 'Kopieren';

  @override
  String get tooltip_share => 'Teilen';

  @override
  String get snackbar_text => 'Text in die Zwischenablage kopiert!';

  @override
  String get snackbar_empty_text => 'Nichts zum Kopieren oder Teilen';

  @override
  String max_limit_text(Object max) {
    return 'Bis zu $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'Was du erhältst:';

  @override
  String get premium_feature_no_ads => 'Vollständige Entfernung aller Werbung';

  @override
  String get premium_feature_unlimited =>
      'Bis zu 100.000 Wiederholungen auf einmal';

  @override
  String get premium_feature_support => 'Priorisierte Unterstützung';

  @override
  String get premium_one_time => 'Einmaliger Kauf — für immer!';

  @override
  String get premium_button_buy => 'PRO kaufen — 3,99 \$';

  @override
  String get premium_button_later => 'Später';

  @override
  String get share_file_name => 'wiederholter_text';

  @override
  String get share_too_large =>
      'Der Text ist zu groß zum direkten Teilen.\nVerwende stattdessen \"Kopieren\".';

  @override
  String get share_error => 'Teilen fehlgeschlagen';

  @override
  String copy_limit_exceeded(Object max) {
    return 'Kopieren ist nur bis zu $max Zeilen möglich.\nVerwende \"Teilen\" für längere Texte.';
  }

  @override
  String get copy_too_large => 'Text konnte nicht kopiert werden';

  @override
  String get limit_free => 'Bis zu 2000';

  @override
  String get limit_premium => 'Bis zu 100000';

  @override
  String get drawer_header => 'Text Repeater App';

  @override
  String get drawer_title_rate => 'App bewerten';

  @override
  String get drawer_title_privacy => 'Datenschutzerklärung';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Englisch',
        'fr': 'Französisch',
        'es': 'Spanisch',
        'de': 'Deutsch',
        'id': 'Indonesisch',
        'ko': 'Koreanisch',
        'pt': 'Portugiesisch',
        'ru': 'Russisch',
        'ja': 'Japanisch',
        'other': 'Unbekannt',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'Wiederholungen des Textes';

  @override
  String get purchase_next_update =>
      'Der Kauf wird im nächsten Update verfügbar sein.';

  @override
  String get no_items => 'Keine Einträge';
}
