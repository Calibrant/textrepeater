// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  static String m0(locale) =>
      "${Intl.select(locale, {'en': 'English', 'fr': 'Français', 'es': 'Español', 'de': 'Deutsch', 'id': 'Bahasa\nIndonesia', 'ko': '한국어', 'ms': 'Melayu', 'pt': 'Português', 'ru': 'Русский', 'ja': '日本語', 'other': '-'})}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "app_title": MessageLookupByLibrary.simpleMessage("Repetir texto"),
    "checkbox_title": MessageLookupByLibrary.simpleMessage("Criar nova linha"),
    "drawer_header": MessageLookupByLibrary.simpleMessage("Texto do repetidor"),
    "drawer_title_privacy": MessageLookupByLibrary.simpleMessage(
      "Política de privacidade",
    ),
    "drawer_title_rate": MessageLookupByLibrary.simpleMessage(
      "Avaliar este aplicativo",
    ),
    "elevated_btn_generate": MessageLookupByLibrary.simpleMessage(
      "Gerar texto",
    ),
    "elevated_btn_reset": MessageLookupByLibrary.simpleMessage("Redefinir"),
    "label_text1": MessageLookupByLibrary.simpleMessage("Digite seu texto"),
    "label_text2": MessageLookupByLibrary.simpleMessage(
      "Quantas vezes repetir o texto?",
    ),
    "main_title": MessageLookupByLibrary.simpleMessage("Texto do Repetidor"),
    "pageSettingsInputLanguage": m0,
    "snackbar_text": MessageLookupByLibrary.simpleMessage("Texto copiado"),
    "text_max1000": MessageLookupByLibrary.simpleMessage(
      "máximo de 1000 linhas",
    ),
    "tooltip_copy": MessageLookupByLibrary.simpleMessage("Copiar"),
    "tooltip_share": MessageLookupByLibrary.simpleMessage("Compartilhar"),
  };
}
