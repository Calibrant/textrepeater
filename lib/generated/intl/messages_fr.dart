// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(locale) =>
      "${Intl.select(locale, {'en': 'English', 'fr': 'Français', 'es': 'Español', 'de': 'Deutsch', 'id': 'Bahasa\nIndonesia', 'ko': '한국어', 'ms': 'Melayu', 'pt': 'Português', 'ru': 'Русский', 'ja': '日本語', 'other': '-'})}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "app_title": MessageLookupByLibrary.simpleMessage(
      "Ajouter du texte, répéter, copier et partager!",
    ),
    "checkbox_title": MessageLookupByLibrary.simpleMessage(
      "Créer une nouvelle ligne",
    ),
    "drawer_header": MessageLookupByLibrary.simpleMessage("Text repeater app"),
    "drawer_title_privacy": MessageLookupByLibrary.simpleMessage(
      "Politique de confidentialité",
    ),
    "drawer_title_rate": MessageLookupByLibrary.simpleMessage(
      "Notez cette application",
    ),
    "elevated_btn_generate": MessageLookupByLibrary.simpleMessage(
      "Générer du texte",
    ),
    "elevated_btn_reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "label_text1": MessageLookupByLibrary.simpleMessage("Entrez votre texte"),
    "label_text2": MessageLookupByLibrary.simpleMessage(
      "Combien de fois répéter le texte?",
    ),
    "main_title": MessageLookupByLibrary.simpleMessage(
      "Ajouter du texte, répéter, copier et partager!",
    ),
    "pageSettingsInputLanguage": m0,
    "snackbar_text": MessageLookupByLibrary.simpleMessage("Texte copié"),
    "text_max1000": MessageLookupByLibrary.simpleMessage("1000 lignes maximum"),
    "tooltip_copy": MessageLookupByLibrary.simpleMessage("Copier"),
    "tooltip_share": MessageLookupByLibrary.simpleMessage("Partager"),
  };
}
