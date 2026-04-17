// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru_RU locale. All the
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
  String get localeName => 'ru_RU';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "app_title": MessageLookupByLibrary.simpleMessage("Повторить Текст"),
    "checkbox_title": MessageLookupByLibrary.simpleMessage(
      "Повторять с новой строки",
    ),
    "elevated_btn_generate": MessageLookupByLibrary.simpleMessage(
      "Создать текст",
    ),
    "elevated_btn_reset": MessageLookupByLibrary.simpleMessage("Сброс"),
    "label_text1": MessageLookupByLibrary.simpleMessage("Введите текст"),
    "label_text2": MessageLookupByLibrary.simpleMessage(
      "Сколько раз повторить текст?",
    ),
    "main_title": MessageLookupByLibrary.simpleMessage("Повторяющийся Текст"),
    "snackbar_text": MessageLookupByLibrary.simpleMessage("Текст скопирован"),
    "text_max1000": MessageLookupByLibrary.simpleMessage("До 1000 раз"),
    "tooltip_copy": MessageLookupByLibrary.simpleMessage("Копировать"),
    "tooltip_share": MessageLookupByLibrary.simpleMessage("Поделиться"),
  };
}
