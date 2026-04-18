import 'package:flutter/material.dart';
import 'package:text_repeater/l10n/app_localizations.dart';
import 'package:text_repeater/main.dart';
import 'package:text_repeater/text_repeater.dart';
import 'repeater_text_app_core/constants.dart';
import 'repeater_text_app_core/text_repeater_launch_url.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  AppLocalizations.of(context).drawer_header,
                  style: context.theme.textTheme.titleLarge!
                      .copyWith(color: Colors.white),
                ),
              )),
          ListTile(
            leading: const Icon(Icons.touch_app, color: Colors.blue),
            title: Text(AppLocalizations.of(context).drawer_title_rate), //thumb_up
            onTap: () {
              const googlePlay = TextRepeaterLaunchUrl();
              googlePlay.openURL(AppConst.googlePlay);
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.blue),
            title: Text(AppLocalizations.of(context).drawer_title_privacy),
            onTap: () {
              const prPolicy = TextRepeaterLaunchUrl();
              prPolicy.openURL(AppConst.prPolicy);
            },
          ),
          const ListTile(
            leading: Icon(Icons.verified, color: Colors.blue),
            title: Text('version 1.1.1'),
          ),
        ],
      ),
    );
  }
}
