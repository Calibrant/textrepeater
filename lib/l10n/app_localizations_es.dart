// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get main_title => 'Texto repetidor';

  @override
  String get app_title => 'Repetir texto';

  @override
  String get snackbar_text => 'Texto copiado';

  @override
  String get label_text1 => 'Ingresa tu texto';

  @override
  String get label_text2 => '¿Cuántas veces repites el texto?';

  @override
  String get checkbox_title => 'Crear nueva línea';

  @override
  String get text_max1000 => 'máximo2000 líneas';

  @override
  String get elevated_btn_generate => 'Generar Texto';

  @override
  String get elevated_btn_reset => 'Restablecer';

  @override
  String get tooltip_copy => 'Copiar';

  @override
  String get tooltip_share => 'Compartir';

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

/// The translations for Spanish Castilian, as used in Spain (`es_ES`).
class AppLocalizationsEsEs extends AppLocalizationsEs {
  AppLocalizationsEsEs() : super('es_ES');

  @override
  String get main_title => 'Texto repetidor';

  @override
  String get app_title => 'Repetir texto';

  @override
  String get snackbar_text => 'Texto copiado';

  @override
  String get label_text1 => 'Ingresa tu texto';

  @override
  String get label_text2 => '¿Cuántas veces repites el texto?';

  @override
  String get checkbox_title => 'Crear nueva línea';

  @override
  String get text_max1000 => 'máximo 2000 líneas';

  @override
  String get elevated_btn_generate => 'Generar Texto';

  @override
  String get elevated_btn_reset => 'Restablecer';

  @override
  String get tooltip_copy => 'Copiar';

  @override
  String get tooltip_share => 'Compartir';
}
