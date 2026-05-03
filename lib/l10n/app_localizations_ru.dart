// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get main_title =>
      'Добавить текст, повторить, скопировать и поделиться!';

  @override
  String get app_title => 'Повторить текст';

  @override
  String get label_text1 => 'Введите ваш текст';

  @override
  String get label_text2 => 'Сколько раз повторить текст?';

  @override
  String get checkbox_title => 'Создавать новую строку';

  @override
  String get elevated_btn_generate => 'Сгенер. текст';

  @override
  String get elevated_btn_reset => 'Сбросить';

  @override
  String get tooltip_copy => 'Копировать';

  @override
  String get tooltip_share => 'Поделиться';

  @override
  String get snackbar_text => 'Текст скопирован в буфер обмена!';

  @override
  String get snackbar_empty_text => 'Нечего копировать или поделиться';

  @override
  String max_limit_text(Object max) {
    return 'До $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'Что вы получите:';

  @override
  String get premium_feature_no_ads => 'Полное удаление всей рекламы';

  @override
  String get premium_feature_unlimited => 'До 100 000 повторений за раз';

  @override
  String get premium_feature_support => 'Приоритетная поддержка';

  @override
  String get premium_one_time => 'Одноразовая покупка — навсегда!';

  @override
  String get premium_button_buy => 'Купить PRO — \$3.99';

  @override
  String get premium_button_later => 'Позже';

  @override
  String get share_file_name => 'повторенный_текст';

  @override
  String get share_too_large =>
      'Текст слишком большой для прямого шаринга.\nИспользуйте «Копировать».';

  @override
  String get share_error => 'Не удалось поделиться';

  @override
  String copy_limit_exceeded(Object max) {
    return 'Копирование доступно только до $max строк.\nИспользуйте «Поделиться» для больших текстов.';
  }

  @override
  String get copy_too_large => 'Не удалось скопировать текст';

  @override
  String get limit_free => 'До 2000';

  @override
  String get limit_premium => 'До 100000';

  @override
  String get drawer_header => 'Приложение Text Repeater';

  @override
  String get drawer_title_rate => 'Оценить приложение';

  @override
  String get drawer_title_privacy => 'Политика конфиденциальности';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Английский',
        'fr': 'Французский',
        'es': 'Испанский',
        'de': 'Немецкий',
        'id': 'Индонезийский',
        'ko': 'Корейский',
        'pt': 'Португальский',
        'ru': 'Русский',
        'ja': 'Японский',
        'other': 'Другой',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'повторений текста';

  @override
  String get purchase_next_update =>
      'Покупка будет доступна в следующем обновлении.';

  @override
  String get no_items => 'Нет элементов';
}

/// The translations for Russian, as used in Russian Federation (`ru_RU`).
class AppLocalizationsRuRu extends AppLocalizationsRu {
  AppLocalizationsRuRu() : super('ru_RU');

  @override
  String get main_title =>
      'Добавить текст, повторить, скопировать и поделиться!';

  @override
  String get app_title => 'Повторить текст';

  @override
  String get label_text1 => 'Введите ваш текст';

  @override
  String get label_text2 => 'Сколько раз повторить текст?';

  @override
  String get checkbox_title => 'Создавать новую строку';

  @override
  String get elevated_btn_generate => 'Сгенер. текст';

  @override
  String get elevated_btn_reset => 'Сбросить';

  @override
  String get tooltip_copy => 'Копировать';

  @override
  String get tooltip_share => 'Поделиться';

  @override
  String get snackbar_text => 'Текст скопирован в буфер обмена!';

  @override
  String get snackbar_empty_text => 'Нечего копировать или поделиться';

  @override
  String max_limit_text(Object max) {
    return 'До $max';
  }

  @override
  String get premium_title => 'Text Repeater PRO';

  @override
  String get premium_subtitle => 'Что вы получите:';

  @override
  String get premium_feature_no_ads => 'Полное удаление всей рекламы';

  @override
  String get premium_feature_unlimited => 'До 100 000 повторений за раз';

  @override
  String get premium_feature_support => 'Приоритетная поддержка';

  @override
  String get premium_one_time => 'Одноразовая покупка — навсегда!';

  @override
  String get premium_button_buy => 'Купить PRO — \$3.99';

  @override
  String get premium_button_later => 'Позже';

  @override
  String get share_file_name => 'повторенный_текст';

  @override
  String get share_too_large =>
      'Текст слишком большой для прямого шаринга.\nИспользуйте «Копировать».';

  @override
  String get share_error => 'Не удалось поделиться';

  @override
  String copy_limit_exceeded(Object max) {
    return 'Копирование доступно только до $max строк.\nИспользуйте «Поделиться» для больших текстов.';
  }

  @override
  String get copy_too_large => 'Не удалось скопировать текст';

  @override
  String get limit_free => 'До 2000';

  @override
  String get limit_premium => 'До 100000';

  @override
  String get drawer_header => 'Приложение Text Repeater';

  @override
  String get drawer_title_rate => 'Оценить приложение';

  @override
  String get drawer_title_privacy => 'Политика конфиденциальности';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Английский',
        'fr': 'Французский',
        'es': 'Испанский',
        'de': 'Немецкий',
        'id': 'Индонезийский',
        'ko': 'Корейский',
        'pt': 'Португальский',
        'ru': 'Русский',
        'ja': 'Японский',
        'other': 'Другой',
      },
    );
    return '$_temp0';
  }

  @override
  String get repetitions_text => 'повторений текста';

  @override
  String get purchase_next_update =>
      'Покупка будет доступна в следующем обновлении.';

  @override
  String get no_items => 'Нет элементов';
}
