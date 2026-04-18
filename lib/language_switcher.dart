import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_repeater/l10n/app_localizations.dart';
import 'package:text_repeater/repeater_text_app_core/locale_provider_model.dart';

class LocaleLanguageSwitcherWidget extends StatelessWidget {
  const LocaleLanguageSwitcherWidget({super.key});

 @override
Widget build(BuildContext context) {
  List<String> options = <String>[
    'en', 'fr', 'es', 'de', 'id', 'ko', 'pt', 'ru', 'ja'
  ];
  
  // 🔧 ИСПРАВЛЕНИЕ: берём только язык (первые 2 символа)
  var fullLocale = Localizations.localeOf(context).toString();
  var selectedLocale = fullLocale.split('_')[0];  // "ru_RU" → "ru"
  
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: SizedBox(
      width: 100,
      height: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Consumer(
              builder: ((context, ref, child) => DropdownButton(
                isExpanded: true,
                iconSize: 0.0,
                value: selectedLocale,  // теперь "ru" (совпадает с items)
                selectedItemBuilder: ((context) => options
                    .map((e) => Center(
                          child: Text(
                            e,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ))
                    .toList()),
                items: [
                  ...options.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(AppLocalizations.of(context).pageSettingsInputLanguage(e)),
                    );
                  }).toList(),
                ],
                onChanged: (String? value) {
                  if (value != null) {
                    ref
                        .watch<LocaleModelProvider>(localeProvider)
                        .setLocaleLanguage(Locale(value));
                  }
                },
              )),
            ),
          ),
        ],
      ),
    ),
  );
}
}
