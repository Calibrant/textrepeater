// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get main_title => 'Adicionar Texto, Repetir, Copiar e Compartilhar!';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'Digite seu texto';

  @override
  String get label_text2 => 'Quantas vezes repetir o texto?';

  @override
  String get checkbox_title => 'Criar nova linha';

  @override
  String get elevated_btn_generate => 'Gerar Texto';

  @override
  String get elevated_btn_reset => 'Redefinir';

  @override
  String get tooltip_copy => 'Copiar';

  @override
  String get tooltip_share => 'Compartilhar';

  @override
  String get snackbar_text => 'Texto copiado para a área de transferência!';

  @override
  String get snackbar_empty_text => 'Nada para copiar ou compartilhar';

  @override
  String max_limit_text(Object max) {
    return 'Até $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'O que você vai receber:';

  @override
  String get premium_feature_no_ads => 'Remoção completa de todos os anúncios';

  @override
  String get premium_feature_unlimited => 'Até 100.000 repetições de uma vez';

  @override
  String get premium_feature_support => 'Suporte prioritário';

  @override
  String get premium_one_time => 'Compra única — para sempre!';

  @override
  String get premium_button_buy => 'Comprar PRO — \$3.99';

  @override
  String get premium_button_later => 'Depois';

  @override
  String get share_file_name => 'texto_repetido';

  @override
  String get share_too_large =>
      'O texto é muito grande para compartilhar diretamente.\nUse \"Copiar\" em vez disso.';

  @override
  String get share_error => 'Falha ao compartilhar';

  @override
  String copy_limit_exceeded(Object max) {
    return 'A cópia está disponível apenas até $max linhas.\nUse \"Compartilhar\" para textos maiores.';
  }

  @override
  String get copy_too_large => 'Falha ao copiar texto';

  @override
  String get limit_free => 'Até 2000';

  @override
  String get limit_premium => 'Até 100000';

  @override
  String get drawer_header => 'Aplicativo Text Repeater';

  @override
  String get drawer_title_rate => 'Avaliar este app';

  @override
  String get drawer_title_privacy => 'Política de Privacidade';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Inglês',
        'fr': 'Francês',
        'es': 'Espanhol',
        'de': 'Alemão',
        'id': 'Indonésio',
        'ko': 'Coreano',
        'pt': 'Português',
        'ru': 'Russo',
        'ja': 'Japonês',
        'other': 'Outro',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'repetições do texto';

  @override
  String get purchase_next_update =>
      'A compra estará disponível na próxima atualização.';

  @override
  String get no_items => 'Nenhum item';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get main_title => 'Adicionar Texto, Repetir, Copiar e Compartilhar!';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'Digite seu texto';

  @override
  String get label_text2 => 'Quantas vezes repetir o texto?';

  @override
  String get checkbox_title => 'Criar nova linha';

  @override
  String get elevated_btn_generate => 'Gerar Texto';

  @override
  String get elevated_btn_reset => 'Redefinir';

  @override
  String get tooltip_copy => 'Copiar';

  @override
  String get tooltip_share => 'Compartilhar';

  @override
  String get snackbar_text => 'Texto copiado para a área de transferência!';

  @override
  String get snackbar_empty_text => 'Nada para copiar ou compartilhar';

  @override
  String max_limit_text(Object max) {
    return 'Até $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'O que você vai receber:';

  @override
  String get premium_feature_no_ads => 'Remoção completa de todos os anúncios';

  @override
  String get premium_feature_unlimited => 'Até 100.000 repetições de uma vez';

  @override
  String get premium_feature_support => 'Suporte prioritário';

  @override
  String get premium_one_time => 'Compra única — para sempre!';

  @override
  String get premium_button_buy => 'Comprar PRO — \$3.99';

  @override
  String get premium_button_later => 'Depois';

  @override
  String get share_file_name => 'texto_repetido';

  @override
  String get share_too_large =>
      'O texto é muito grande para compartilhar diretamente.\nUse \"Copiar\" em vez disso.';

  @override
  String get share_error => 'Falha ao compartilhar';

  @override
  String copy_limit_exceeded(Object max) {
    return 'A cópia está disponível apenas até $max linhas.\nUse \"Compartilhar\" para textos maiores.';
  }

  @override
  String get copy_too_large => 'Falha ao copiar texto';

  @override
  String get limit_free => 'Até 2000';

  @override
  String get limit_premium => 'Até 100000';

  @override
  String get drawer_header => 'Aplicativo Text Repeater';

  @override
  String get drawer_title_rate => 'Avaliar este app';

  @override
  String get drawer_title_privacy => 'Política de Privacidade';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Inglês',
        'fr': 'Francês',
        'es': 'Espanhol',
        'de': 'Alemão',
        'id': 'Indonésio',
        'ko': 'Coreano',
        'pt': 'Português',
        'ru': 'Russo',
        'ja': 'Japonês',
        'other': 'Outro',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'repetições do texto';

  @override
  String get purchase_next_update =>
      'A compra estará disponível na próxima atualização.';

  @override
  String get no_items => 'Nenhum item';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get main_title => 'Adicionar Texto, Repetir, Copiar e Compartilhar!';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'Digite seu texto';

  @override
  String get label_text2 => 'Quantas vezes repetir o texto?';

  @override
  String get checkbox_title => 'Criar nova linha';

  @override
  String get elevated_btn_generate => 'Gerar Texto';

  @override
  String get elevated_btn_reset => 'Redefinir';

  @override
  String get tooltip_copy => 'Copiar';

  @override
  String get tooltip_share => 'Compartilhar';

  @override
  String get snackbar_text => 'Texto copiado para a área de transferência!';

  @override
  String get snackbar_empty_text => 'Nada para copiar ou compartilhar';

  @override
  String max_limit_text(Object max) {
    return 'Até $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'O que você vai receber:';

  @override
  String get premium_feature_no_ads => 'Remoção completa de todos os anúncios';

  @override
  String get premium_feature_unlimited => 'Até 100.000 repetições de uma vez';

  @override
  String get premium_feature_support => 'Suporte prioritário';

  @override
  String get premium_one_time => 'Compra única — para sempre!';

  @override
  String get premium_button_buy => 'Comprar PRO — \$3.99';

  @override
  String get premium_button_later => 'Depois';

  @override
  String get share_file_name => 'texto_repetido';

  @override
  String get share_too_large =>
      'O texto é muito grande para compartilhar diretamente.\nUse \"Copiar\" em vez disso.';

  @override
  String get share_error => 'Falha ao compartilhar';

  @override
  String copy_limit_exceeded(Object max) {
    return 'A cópia está disponível apenas até $max linhas.\nUse \"Compartilhar\" para textos maiores.';
  }

  @override
  String get copy_too_large => 'Falha ao copiar texto';

  @override
  String get limit_free => 'Até 2000';

  @override
  String get limit_premium => 'Até 100000';

  @override
  String get drawer_header => 'Aplicativo Text Repeater';

  @override
  String get drawer_title_rate => 'Avaliar este app';

  @override
  String get drawer_title_privacy => 'Política de Privacidade';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Inglês',
        'fr': 'Francês',
        'es': 'Espanhol',
        'de': 'Alemão',
        'id': 'Indonésio',
        'ko': 'Coreano',
        'pt': 'Português',
        'ru': 'Russo',
        'ja': 'Japonês',
        'other': 'Outro',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'repetições do texto';

  @override
  String get purchase_next_update =>
      'A compra estará disponível na próxima atualização.';

  @override
  String get no_items => 'Nenhum item';
}
