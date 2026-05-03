import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_repeater/repeater_text_app_core/locale_provider_model.dart';

class LocaleLanguageSwitcherWidget extends ConsumerWidget {
  const LocaleLanguageSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = Localizations.localeOf(context).languageCode;

    // Карта языков с флагами
    final Map<String, Map<String, String>> languages = {
      'en': {'name': 'English', 'flag': '🇬🇧'},
      'fr': {'name': 'Français', 'flag': '🇫🇷'},
      'es': {'name': 'Español', 'flag': '🇪🇸'},
      'de': {'name': 'Deutsch', 'flag': '🇩🇪'},
      'id': {'name': 'Bahasa Indonesia', 'flag': '🇮🇩'},
      'ko': {'name': '한국어', 'flag': '🇰🇷'},
      'pt': {'name': 'Português', 'flag': '🇵🇹'},
      'ru': {'name': 'Русский', 'flag': '🇷🇺'},
      'ja': {'name': '日本語', 'flag': '🇯🇵'},
    };

    final currentLang = languages[currentLocale] ?? languages['en']!;

    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentLang['flag']!,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down_rounded,
              size: 20, color: Colors.white),
        ],
      ),
      tooltip: 'Change Language',
      onPressed: () => _showLanguageSelector(context, ref, languages),
    );
  }

  void _showLanguageSelector(
    BuildContext context,
    WidgetRef ref,
    Map<String, Map<String, String>> languages,
  ) {
    final currentLocale = Localizations.localeOf(context).languageCode;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.45,
          minChildSize: 0.35,
          maxChildSize: 0.75,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Select Language',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      final entry = languages.entries.elementAt(index);
                      final code = entry.key;
                      final data = entry.value;
                      final isSelected = code == currentLocale;

                      return ListTile(
                        leading: Text(data['flag']!,
                            style: const TextStyle(fontSize: 26)),
                        title: Text(
                          data['name']!,
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                        trailing: isSelected
                            ? const Icon(Icons.check,
                                color: Colors.green, size: 26)
                            : null,
                        onTap: () {
                          ref
                              .read(localeProvider.notifier)
                              .setLocaleLanguage(Locale(code));
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}









/* import 'package:flutter/material.dart';
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
 */