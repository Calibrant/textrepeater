import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('de', 'DE'),
    Locale('en'),
    Locale('es'),
    Locale('es', 'ES'),
    Locale('fr'),
    Locale('id'),
    Locale('id', 'ID'),
    Locale('ja'),
    Locale('ko'),
    Locale('ko', 'KR'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT'),
    Locale('ru'),
    Locale('ru', 'RU')
  ];

  /// No description provided for @main_title.
  ///
  /// In en, this message translates to:
  /// **'Add Text, Repeat, Copy and Share!'**
  String get main_title;

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'Text Repeater'**
  String get app_title;

  /// No description provided for @label_text1.
  ///
  /// In en, this message translates to:
  /// **'Enter your text'**
  String get label_text1;

  /// No description provided for @label_text2.
  ///
  /// In en, this message translates to:
  /// **'How many times to repeat the text?'**
  String get label_text2;

  /// No description provided for @checkbox_title.
  ///
  /// In en, this message translates to:
  /// **'Create new line'**
  String get checkbox_title;

  /// No description provided for @elevated_btn_generate.
  ///
  /// In en, this message translates to:
  /// **'Generate Text'**
  String get elevated_btn_generate;

  /// No description provided for @elevated_btn_reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get elevated_btn_reset;

  /// No description provided for @tooltip_copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get tooltip_copy;

  /// No description provided for @tooltip_share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get tooltip_share;

  /// No description provided for @snackbar_text.
  ///
  /// In en, this message translates to:
  /// **'Text copied to clipboard!'**
  String get snackbar_text;

  /// No description provided for @snackbar_empty_text.
  ///
  /// In en, this message translates to:
  /// **'Nothing to copy or share'**
  String get snackbar_empty_text;

  /// No description provided for @max_limit_text.
  ///
  /// In en, this message translates to:
  /// **'Up to {max}'**
  String max_limit_text(Object max);

  /// No description provided for @premium_title.
  ///
  /// In en, this message translates to:
  /// **'Text Repeater PRO'**
  String get premium_title;

  /// No description provided for @premium_subtitle.
  ///
  /// In en, this message translates to:
  /// **'What you\'ll get:'**
  String get premium_subtitle;

  /// No description provided for @premium_feature_no_ads.
  ///
  /// In en, this message translates to:
  /// **'Complete removal of all ads'**
  String get premium_feature_no_ads;

  /// No description provided for @premium_feature_unlimited.
  ///
  /// In en, this message translates to:
  /// **'Up to 100,000 repetitions at once'**
  String get premium_feature_unlimited;

  /// No description provided for @premium_feature_support.
  ///
  /// In en, this message translates to:
  /// **'Priority support'**
  String get premium_feature_support;

  /// No description provided for @premium_one_time.
  ///
  /// In en, this message translates to:
  /// **'One-time purchase — forever!'**
  String get premium_one_time;

  /// No description provided for @premium_button_buy.
  ///
  /// In en, this message translates to:
  /// **'Buy PRO — \$3.99'**
  String get premium_button_buy;

  /// No description provided for @premium_button_later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get premium_button_later;

  /// No description provided for @share_file_name.
  ///
  /// In en, this message translates to:
  /// **'repeated_text'**
  String get share_file_name;

  /// No description provided for @share_too_large.
  ///
  /// In en, this message translates to:
  /// **'Text is too large for direct sharing.\nUse \"Copy\" instead.'**
  String get share_too_large;

  /// No description provided for @share_error.
  ///
  /// In en, this message translates to:
  /// **'Failed to share'**
  String get share_error;

  /// No description provided for @copy_limit_exceeded.
  ///
  /// In en, this message translates to:
  /// **'Copying is available only up to {max} lines.\nUse \"Share\" for larger texts.'**
  String copy_limit_exceeded(Object max);

  /// No description provided for @copy_too_large.
  ///
  /// In en, this message translates to:
  /// **'Failed to copy text'**
  String get copy_too_large;

  /// No description provided for @limit_free.
  ///
  /// In en, this message translates to:
  /// **'Up to 2000'**
  String get limit_free;

  /// No description provided for @limit_premium.
  ///
  /// In en, this message translates to:
  /// **'Up to 100000'**
  String get limit_premium;

  /// No description provided for @drawer_header.
  ///
  /// In en, this message translates to:
  /// **'Text repeater app'**
  String get drawer_header;

  /// No description provided for @drawer_title_rate.
  ///
  /// In en, this message translates to:
  /// **'Rate this app'**
  String get drawer_title_rate;

  /// No description provided for @drawer_title_privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get drawer_title_privacy;

  /// No description provided for @pageSettingsInputLanguage.
  ///
  /// In en, this message translates to:
  /// **'{locale, select, en {English} fr {French} es {Spanish} de {German} id {Indonesian} ko {Korean} pt {Portuguese} ru {Russian} ja {Japanese} other {Unknown}}'**
  String pageSettingsInputLanguage(String locale);

  /// No description provided for @repetitions_text.
  ///
  /// In en, this message translates to:
  /// **'repetitions of text'**
  String get repetitions_text;

  /// No description provided for @purchase_next_update.
  ///
  /// In en, this message translates to:
  /// **'Purchase will be available in the next update.'**
  String get purchase_next_update;

  /// No description provided for @no_items.
  ///
  /// In en, this message translates to:
  /// **'No items'**
  String get no_items;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'id',
        'ja',
        'ko',
        'pt',
        'ru'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'de':
      {
        switch (locale.countryCode) {
          case 'DE':
            return AppLocalizationsDeDe();
        }
        break;
      }
    case 'es':
      {
        switch (locale.countryCode) {
          case 'ES':
            return AppLocalizationsEsEs();
        }
        break;
      }
    case 'id':
      {
        switch (locale.countryCode) {
          case 'ID':
            return AppLocalizationsIdId();
        }
        break;
      }
    case 'ko':
      {
        switch (locale.countryCode) {
          case 'KR':
            return AppLocalizationsKoKr();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
    case 'ru':
      {
        switch (locale.countryCode) {
          case 'RU':
            return AppLocalizationsRuRu();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'id':
      return AppLocalizationsId();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
