// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get main_title => '¡Añadir texto, repetir, copiar y compartir!';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'Introduce tu texto';

  @override
  String get label_text2 => '¿Cuántas veces repetir el texto?';

  @override
  String get checkbox_title => 'Crear nueva línea';

  @override
  String get elevated_btn_generate => 'Generar texto';

  @override
  String get elevated_btn_reset => 'Reiniciar';

  @override
  String get tooltip_copy => 'Copiar';

  @override
  String get tooltip_share => 'Compartir';

  @override
  String get snackbar_text => '¡Texto copiado al portapapeles!';

  @override
  String get snackbar_empty_text => 'Nada para copiar o compartir';

  @override
  String max_limit_text(Object max) {
    return 'Hasta $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'Lo que obtendrás:';

  @override
  String get premium_feature_no_ads =>
      'Eliminación completa de toda la publicidad';

  @override
  String get premium_feature_unlimited => 'Hasta 100.000 repeticiones a la vez';

  @override
  String get premium_feature_support => 'Soporte prioritario';

  @override
  String get premium_one_time => '¡Compra única — para siempre!';

  @override
  String get premium_button_buy => 'Comprar PRO — \$3.99';

  @override
  String get premium_button_later => 'Más tarde';

  @override
  String get share_file_name => 'texto_repetido';

  @override
  String get share_too_large =>
      'El texto es demasiado grande para compartir directamente.\nUsa \"Copiar\" en su lugar.';

  @override
  String get share_error => 'Error al compartir';

  @override
  String copy_limit_exceeded(Object max) {
    return 'La copia solo está disponible hasta $max líneas.\nUsa \"Compartir\" para textos más largos.';
  }

  @override
  String get copy_too_large => 'No se pudo copiar el texto';

  @override
  String get limit_free => 'Hasta 2000';

  @override
  String get limit_premium => 'Hasta 100000';

  @override
  String get drawer_header => 'Aplicación Text Repeater';

  @override
  String get drawer_title_rate => 'Calificar esta app';

  @override
  String get drawer_title_privacy => 'Política de privacidad';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Inglés',
        'fr': 'Francés',
        'es': 'Español',
        'de': 'Alemán',
        'id': 'Indonesio',
        'ko': 'Coreano',
        'pt': 'Portugués',
        'ru': 'Ruso',
        'ja': 'Japonés',
        'other': 'Desconocido',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'repeticiones de texto';

  @override
  String get purchase_next_update =>
      'La compra estará disponible en la próxima actualización.';

  @override
  String get no_items => 'Sin elementos';
}

/// The translations for Spanish Castilian, as used in Spain (`es_ES`).
class AppLocalizationsEsEs extends AppLocalizationsEs {
  AppLocalizationsEsEs() : super('es_ES');

  @override
  String get main_title => '¡Añadir texto, repetir, copiar y compartir!';

  @override
  String get app_title => 'Text Repeater';

  @override
  String get label_text1 => 'Introduce tu texto';

  @override
  String get label_text2 => '¿Cuántas veces repetir el texto?';

  @override
  String get checkbox_title => 'Crear nueva línea';

  @override
  String get elevated_btn_generate => 'Generar texto';

  @override
  String get elevated_btn_reset => 'Reiniciar';

  @override
  String get tooltip_copy => 'Copiar';

  @override
  String get tooltip_share => 'Compartir';

  @override
  String get snackbar_text => '¡Texto copiado al portapapeles!';

  @override
  String get snackbar_empty_text => 'Nada para copiar o compartir';

  @override
  String max_limit_text(Object max) {
    return 'Hasta $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'Lo que obtendrás:';

  @override
  String get premium_feature_no_ads =>
      'Eliminación completa de toda la publicidad';

  @override
  String get premium_feature_unlimited => 'Hasta 100.000 repeticiones a la vez';

  @override
  String get premium_feature_support => 'Soporte prioritario';

  @override
  String get premium_one_time => '¡Compra única — para siempre!';

  @override
  String get premium_button_buy => 'Comprar PRO — \$3.99';

  @override
  String get premium_button_later => 'Más tarde';

  @override
  String get share_file_name => 'texto_repetido';

  @override
  String get share_too_large =>
      'El texto es demasiado grande para compartir directamente.\nUsa \"Copiar\" en su lugar.';

  @override
  String get share_error => 'Error al compartir';

  @override
  String copy_limit_exceeded(Object max) {
    return 'La copia solo está disponible hasta $max líneas.\nUsa \"Compartir\" para textos más largos.';
  }

  @override
  String get copy_too_large => 'No se pudo copiar el texto';

  @override
  String get limit_free => 'Hasta 2000';

  @override
  String get limit_premium => 'Hasta 100000';

  @override
  String get drawer_header => 'Aplicación Text Repeater';

  @override
  String get drawer_title_rate => 'Calificar esta app';

  @override
  String get drawer_title_privacy => 'Política de privacidad';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Inglés',
        'fr': 'Francés',
        'es': 'Español',
        'de': 'Alemán',
        'id': 'Indonesio',
        'ko': 'Coreano',
        'pt': 'Portugués',
        'ru': 'Ruso',
        'ja': 'Japonés',
        'other': 'Desconocido',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'repeticiones de texto';

  @override
  String get purchase_next_update =>
      'La compra estará disponible en la próxima actualización.';

  @override
  String get no_items => 'Sin elementos';
}
