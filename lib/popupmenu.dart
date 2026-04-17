import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_repeater/text_repeater_widgets/listtile.dart';
import 'Provider/repeater_text_theme_provider.dart';

enum SampleColorItem { blue, dark, yellow, deeppurple }

class PopupMenu extends StatefulWidget {
  const PopupMenu({super.key});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  SampleColorItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      return PopupMenuButton(
          icon: const Icon(Icons.color_lens),
          initialValue: selectedMenu,
          onSelected: (SampleColorItem value) => selectedMenu = value,
          itemBuilder: ((BuildContext context) =>
              <PopupMenuEntry<SampleColorItem>>[
                PopupMenuItem<SampleColorItem>(
                    onTap: () {
                      ref.watch(themeProvider).setTheme(0);
                    },
                    value: SampleColorItem.blue,
                    child: ListTileWidget(
                      iconColor: Colors.blue,
                      text: const Text('Blue'),
                    )),
                PopupMenuItem<SampleColorItem>(
                    onTap: () {
                      ref.watch(themeProvider).setTheme(1);
                    },
                    value: SampleColorItem.yellow,
                    child: ListTileWidget(
                      iconColor: const Color(0xffF9AA33),
                      text: const Text('Orange'),
                    )),
                PopupMenuItem<SampleColorItem>(
                    onTap: () {
                      ref.watch(themeProvider).setTheme(2);
                    },
                    value: SampleColorItem.deeppurple,
                    child: ListTileWidget(
                      iconColor: const Color(0xff5D1049),
                      text: const Text('Purple'),
                    )),
              ]));
    }));
  }
}
