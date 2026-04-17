// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a id locale. All the
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
  String get localeName => 'id';

  static String m0(locale) =>
      "${Intl.select(locale, {'en': 'English', 'fr': 'Français', 'es': 'Español', 'de': 'Deutsch', 'id': 'Bahasa\nIndonesia', 'ko': '한국어', 'ms': 'Melayu', 'pt': 'Português', 'ru': 'Русский', 'ja': '日本語', 'other': '-'})}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "app_title": MessageLookupByLibrary.simpleMessage("Ulangi Teks"),
    "checkbox_title": MessageLookupByLibrary.simpleMessage("Buat baris baru"),
    "elevated_btn_generate": MessageLookupByLibrary.simpleMessage("Buat Teks"),
    "elevated_btn_reset": MessageLookupByLibrary.simpleMessage("Setel Ulang"),
    "label_text1": MessageLookupByLibrary.simpleMessage("Masukkan teks Anda"),
    "label_text2": MessageLookupByLibrary.simpleMessage(
      "Berapa kali pengulangan teks?",
    ),
    "main_title": MessageLookupByLibrary.simpleMessage("Teks Pengulang"),
    "pageSettingsInputLanguage": m0,
    "snackbar_text": MessageLookupByLibrary.simpleMessage("Teks disalin"),
    "text_max1000": MessageLookupByLibrary.simpleMessage("maks 1000 baris"),
    "tooltip_copy": MessageLookupByLibrary.simpleMessage("Salin"),
    "tooltip_share": MessageLookupByLibrary.simpleMessage("Bagikan"),
  };
}
