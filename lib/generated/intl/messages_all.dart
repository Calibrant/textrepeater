// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_de.dart' as messages_de;
import 'messages_de_DE.dart' as messages_de_de;
import 'messages_en.dart' as messages_en;
import 'messages_es.dart' as messages_es;
import 'messages_es_ES.dart' as messages_es_es;
import 'messages_fr.dart' as messages_fr;
import 'messages_id.dart' as messages_id;
import 'messages_id_ID.dart' as messages_id_id;
import 'messages_ja.dart' as messages_ja;
import 'messages_ko.dart' as messages_ko;
import 'messages_ko_KR.dart' as messages_ko_kr;
import 'messages_pt.dart' as messages_pt;
import 'messages_pt_BR.dart' as messages_pt_br;
import 'messages_pt_PT.dart' as messages_pt_pt;
import 'messages_ru.dart' as messages_ru;
import 'messages_ru_RU.dart' as messages_ru_ru;

typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
  'de': () => new SynchronousFuture(null),
  'de_DE': () => new SynchronousFuture(null),
  'en': () => new SynchronousFuture(null),
  'es': () => new SynchronousFuture(null),
  'es_ES': () => new SynchronousFuture(null),
  'fr': () => new SynchronousFuture(null),
  'id': () => new SynchronousFuture(null),
  'id_ID': () => new SynchronousFuture(null),
  'ja': () => new SynchronousFuture(null),
  'ko': () => new SynchronousFuture(null),
  'ko_KR': () => new SynchronousFuture(null),
  'pt': () => new SynchronousFuture(null),
  'pt_BR': () => new SynchronousFuture(null),
  'pt_PT': () => new SynchronousFuture(null),
  'ru': () => new SynchronousFuture(null),
  'ru_RU': () => new SynchronousFuture(null),
};

MessageLookupByLibrary? _findExact(String localeName) {
  switch (localeName) {
    case 'de':
      return messages_de.messages;
    case 'de_DE':
      return messages_de_de.messages;
    case 'en':
      return messages_en.messages;
    case 'es':
      return messages_es.messages;
    case 'es_ES':
      return messages_es_es.messages;
    case 'fr':
      return messages_fr.messages;
    case 'id':
      return messages_id.messages;
    case 'id_ID':
      return messages_id_id.messages;
    case 'ja':
      return messages_ja.messages;
    case 'ko':
      return messages_ko.messages;
    case 'ko_KR':
      return messages_ko_kr.messages;
    case 'pt':
      return messages_pt.messages;
    case 'pt_BR':
      return messages_pt_br.messages;
    case 'pt_PT':
      return messages_pt_pt.messages;
    case 'ru':
      return messages_ru.messages;
    case 'ru_RU':
      return messages_ru_ru.messages;
    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) {
  var availableLocale = Intl.verifiedLocale(
    localeName,
    (locale) => _deferredLibraries[locale] != null,
    onFailure: (_) => null,
  );
  if (availableLocale == null) {
    return new SynchronousFuture(false);
  }
  var lib = _deferredLibraries[availableLocale];
  lib == null ? new SynchronousFuture(false) : lib();
  initializeInternalMessageLookup(() => new CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);
  return new SynchronousFuture(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(String locale) {
  var actualLocale = Intl.verifiedLocale(
    locale,
    _messagesExistFor,
    onFailure: (_) => null,
  );
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
