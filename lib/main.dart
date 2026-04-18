// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:text_repeater/Provider/repeater_text_theme_provider.dart';
import 'package:text_repeater/l10n/app_localizations.dart';
import 'package:text_repeater/language_switcher.dart';
import 'package:text_repeater/repeat_text_bar_drawer.dart';
import 'package:text_repeater/repeater_text_app_core/locale_provider_model.dart';
import 'package:text_repeater/text_repeater.dart';
import 'package:text_repeater/text_repeater_admob/ad_helper.dart';
import 'package:text_repeater/themeextension_mycolor.dart';
import 'package:text_repeater/repeater_text_app_core/text_repeater_style/styles.dart';
import 'package:text_repeater/popupmenu.dart';
import 'checkbox_newline.dart';
import 'numerical_range_formatter.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:share_plus/share_plus.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(ProviderScope(child: MainTextRepeaterApp())));
}

// ignore: must_be_immutable
class MainTextRepeaterApp extends StatelessWidget {
  MainTextRepeaterApp({super.key});
  Styles styles = Styles();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, ref, child) {
        return MaterialApp(
          theme: styles.themeData(
              ref.watch<TextRepeaterThemeProvider>(themeProvider).themeIndex,
              context),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: ref.watch<LocaleModelProvider>(localeProvider).locale,
          onGenerateTitle: (BuildContext context) => AppLocalizations.of(context).main_title,
          home: const TextRepeater(),
        );
      }),
    );
  }
}


