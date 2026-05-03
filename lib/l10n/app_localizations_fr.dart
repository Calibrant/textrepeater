// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get main_title => 'Ajouter du texte, répéter, copier et partager !';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'Entrez votre texte';

  @override
  String get label_text2 => 'Combien de fois répéter le texte ?';

  @override
  String get checkbox_title => 'Créer une nouvelle ligne';

  @override
  String get elevated_btn_generate => 'Générer le texte';

  @override
  String get elevated_btn_reset => 'Réinitialiser';

  @override
  String get tooltip_copy => 'Copier';

  @override
  String get tooltip_share => 'Partager';

  @override
  String get snackbar_text => 'Texte copié dans le presse-papiers !';

  @override
  String get snackbar_empty_text => 'Rien à copier ou partager';

  @override
  String max_limit_text(Object max) {
    return 'Jusqu\'à $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'Ce que vous obtiendrez :';

  @override
  String get premium_feature_no_ads =>
      'Suppression complète de toutes les publicités';

  @override
  String get premium_feature_unlimited =>
      'Jusqu\'à 100 000 répétitions à la fois';

  @override
  String get premium_feature_support => 'Support prioritaire';

  @override
  String get premium_one_time => 'Achat unique — pour toujours !';

  @override
  String get premium_button_buy => 'Acheter PRO — 3,99 \$';

  @override
  String get premium_button_later => 'Plus tard';

  @override
  String get share_file_name => 'texte_repeté';

  @override
  String get share_too_large =>
      'Le texte est trop long pour un partage direct.\nUtilisez \"Copier\" à la place.';

  @override
  String get share_error => 'Échec du partage';

  @override
  String copy_limit_exceeded(Object max) {
    return 'La copie est disponible uniquement jusqu\'à $max lignes.\nUtilisez \"Partager\" pour les textes plus longs.';
  }

  @override
  String get copy_too_large => 'Impossible de copier le texte';

  @override
  String get limit_free => 'Jusqu\'à 2000';

  @override
  String get limit_premium => 'Jusqu\'à 100000';

  @override
  String get drawer_header => 'Application Text Repeater';

  @override
  String get drawer_title_rate => 'Évaluer cette application';

  @override
  String get drawer_title_privacy => 'Politique de confidentialité';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Anglais',
        'fr': 'Français',
        'es': 'Espagnol',
        'de': 'Allemand',
        'id': 'Indonésien',
        'ko': 'Coréen',
        'pt': 'Portugais',
        'ru': 'Russe',
        'ja': 'Japonais',
        'other': 'Inconnu',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'répétitions du texte';

  @override
  String get purchase_next_update =>
      'L\'achat sera disponible dans la prochaine mise à jour.';

  @override
  String get no_items => 'Aucun élément';
}
