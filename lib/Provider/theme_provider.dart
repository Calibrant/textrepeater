import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider =
    ChangeNotifierProvider<ThemeProvider>((ref) => ThemeProvider());

class ThemeProvider extends ChangeNotifier {
  int _themeIndex = 0;
  int get themeIndex => _themeIndex;
  //late SharedPreferencesTheme _themePreference;

  /*  ThemeProvider() {
     _themeIndex = 0;
   // _themePreference = SharedPreferencesTheme();
   // getPreferences();
  } */

  setTheme(int value) {
    _themeIndex = value;
    //_themePreference.setPrefsTheme(value);
    notifyListeners();
  }

  /* getPreferences() async {
    _themeIndex = await _themePreference.getTheme();
    notifyListeners();
  }  */
}

/* class SharedPreferencesTheme {
  static const kTHEMeKEY = 'theme_key'; //:);):)

  setPrefsTheme(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('theme_key', value);
  }

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getInt(kTHEMeKEY)??0;
  }
} */
