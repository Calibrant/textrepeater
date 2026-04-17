// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(locale) =>
      "${Intl.select(locale, {'en': 'English', 'fr': 'Français', 'es': 'Español', 'de': 'Deutsch', 'id': 'Bahasa\nIndonesia', 'ko': '한국어', 'ms': 'Melayu', 'pt': 'Português', 'ru': 'Русский', 'ja': '日本語', 'other': '-'})}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "app_title": MessageLookupByLibrary.simpleMessage(
      "Add Text, Repeat, Copy and Share!",
    ),
    "checkbox_title": MessageLookupByLibrary.simpleMessage("Create new line"),
    "drawer_header": MessageLookupByLibrary.simpleMessage("Text repeater app"),
    "drawer_title_privacy": MessageLookupByLibrary.simpleMessage(
      "Privacy Policy",
    ),
    "drawer_title_rate": MessageLookupByLibrary.simpleMessage("Rate this app"),
    "elevated_btn_generate": MessageLookupByLibrary.simpleMessage(
      "Generate Text",
    ),
    "elevated_btn_reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "label_text1": MessageLookupByLibrary.simpleMessage("Enter your text"),
    "label_text2": MessageLookupByLibrary.simpleMessage(
      "How many times repeat the text?",
    ),
    "main_title": MessageLookupByLibrary.simpleMessage(
      "Add Text, Repeat, Copy and Share!",
    ),
    "pageSettingsInputLanguage": m0,
    "snackbar_text": MessageLookupByLibrary.simpleMessage("Text copied"),
    "text_max1000": MessageLookupByLibrary.simpleMessage("max 1000 lines"),
    "tooltip_copy": MessageLookupByLibrary.simpleMessage("Copy"),
    "tooltip_share": MessageLookupByLibrary.simpleMessage("Share"),
  };
}
