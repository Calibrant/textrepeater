// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get main_title => 'Texto do Repetidor';

  @override
  String get app_title => 'Repetir texto';

  @override
  String get snackbar_text => 'Texto copiado';

  @override
  String get label_text1 => 'Digite seu texto';

  @override
  String get label_text2 => 'Quantas vezes repetir o texto?';

  @override
  String get checkbox_title => 'Criar nova linha';

  @override
  String get text_max1000 => 'máximo de 2000 linhas';

  @override
  String get elevated_btn_generate => 'Gerar texto';

  @override
  String get elevated_btn_reset => 'Redefinir';

  @override
  String get tooltip_copy => 'Copiar';

  @override
  String get tooltip_share => 'Compartilhar';

  @override
  String get drawer_header => 'Texto do repetidor';

  @override
  String get drawer_title_rate => 'Avaliar este aplicativo';

  @override
  String get drawer_title_privacy => 'Política de privacidade';

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

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get main_title => 'Texto do Repetidor';

  @override
  String get app_title => 'Repetir texto';

  @override
  String get snackbar_text => 'Texto copiado';

  @override
  String get label_text1 => 'Digite seu texto';

  @override
  String get label_text2 => 'Quantas vezes repetir o texto?';

  @override
  String get checkbox_title => 'Criar nova linha';

  @override
  String get text_max1000 => 'máximo de 2000 linhas';

  @override
  String get elevated_btn_generate => 'Gerar texto';

  @override
  String get elevated_btn_reset => 'Redefinir';

  @override
  String get tooltip_copy => 'Copiar';

  @override
  String get tooltip_share => 'Compartilhar';

  @override
  String get drawer_header => 'Texto do repetidor';

  @override
  String get drawer_title_rate => 'Avaliar este aplicativo';

  @override
  String get drawer_title_privacy => 'Política de privacidade';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get main_title => 'Texto do repetidor';

  @override
  String get app_title => 'Texto de repetição';

  @override
  String get snackbar_text => 'Texto copiado';

  @override
  String get label_text1 => 'Introduza o seu texto';

  @override
  String get label_text2 => 'Quantas vezes repete o texto?';

  @override
  String get checkbox_title => 'Criar nova linha';

  @override
  String get text_max1000 => 'máximo de 2000 linhas';

  @override
  String get elevated_btn_generate => 'Gerar texto';

  @override
  String get elevated_btn_reset => 'Repor';

  @override
  String get tooltip_copy => 'Copiar';

  @override
  String get tooltip_share => 'Partilhar';

  @override
  String get drawer_header => 'Texto do repetidor';

  @override
  String get drawer_title_rate => 'Classificar esta aplicação';

  @override
  String get drawer_title_privacy => 'Política de privacidade';
}
