import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider<TextRepeaterThemeProvider>(
    (ref) => TextRepeaterThemeProvider());

class TextRepeaterThemeProvider extends ChangeNotifier {
  int _themeIndex = 0;
  int get themeIndex => _themeIndex;

  setTheme(int value) {
    _themeIndex = value;
    notifyListeners();
  }
}
