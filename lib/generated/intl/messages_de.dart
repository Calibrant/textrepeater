// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(locale) =>
      "${Intl.select(locale, {'en': 'English', 'fr': 'Français', 'es': 'Español', 'de': 'Deutsch', 'id': 'Bahasa\nIndonesia', 'ko': '한국어', 'ms': 'Melayu', 'pt': 'Português', 'ru': 'Русский', 'ja': '日本語', 'other': '-'})}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "checkbox_title": MessageLookupByLibrary.simpleMessage(
      "Neue Zeile erstellen",
    ),
    "drawer_header": MessageLookupByLibrary.simpleMessage("Wiederholungstext"),
    "drawer_title_privacy": MessageLookupByLibrary.simpleMessage(
      "Datenschutzrichtlinie",
    ),
    "drawer_title_rate": MessageLookupByLibrary.simpleMessage(
      "Diese Anwendung bewerten",
    ),
    "elevated_btn_generate": MessageLookupByLibrary.simpleMessage(
      "Text gener.",
    ),
    "elevated_btn_reset": MessageLookupByLibrary.simpleMessage("Zurücksetzen"),
    "label_text1": MessageLookupByLibrary.simpleMessage(
      "Geben Sie Ihren Text ein",
    ),
    "label_text2": MessageLookupByLibrary.simpleMessage(
      "Wie oft soll der Text wiederholt werden?",
    ),
    "main_title": MessageLookupByLibrary.simpleMessage("Wiederholer-Text"),
    "pageSettingsInputLanguage": m0,
    "snackbar_text": MessageLookupByLibrary.simpleMessage("Kopierter Text"),
    "text_max1000": MessageLookupByLibrary.simpleMessage("max 1000 Zeilen"),
    "tooltip_copy": MessageLookupByLibrary.simpleMessage("Kopieren"),
    "tooltip_share": MessageLookupByLibrary.simpleMessage("Teilen"),
  };
}
