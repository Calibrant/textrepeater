// ignore_for_file: constant_identifier_names
// ignore: duplicate_ignore
import 'package:flutter/material.dart';
import 'package:text_repeater/core/Style/colors.dart';
import 'package:text_repeater/themeextension_mycolor.dart';

class Styles {
  ThemeData themeData(int index, BuildContext context) {
    switch (index) {
      case 0:
        return whiteColorTheme(context);
      case 1:
        return darkColorTheme(context);
      case 2:
        return replyOrangeColorTheme(context);
      case 3:
        return cranePurpleColorTheme(context);
      default:
        return whiteColorTheme(context);
    }
  }

  ThemeData whiteColorTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colored.kWHITE,
      appBarTheme: AppBarTheme(
        backgroundColor: Colored.kDODGERBLUE,
        titleTextStyle: Styles.textTheme(context)
            .headlineMedium!
            .copyWith(color: Colored.kWHITE),
        centerTitle: true,
      ),
      extensions: <ThemeExtension<dynamic>>[AppColorTextRepeater.white],
      unselectedWidgetColor: Colored.kWHITE,
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colored.kWHITE),
        fillColor: MaterialStateProperty.all(Colored.kDODGERBLUE),
      ),
      indicatorColor: Colored.kBLACK,
      inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colored.kBLACK),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: Colored.kDODGERBLUE,
        disabledBackgroundColor: Colored.kGRANIT35,
        foregroundColor: Colored.kWHITE, //Colors.white70,
      )),
      iconTheme: const IconThemeData(color: Colored.kBLACK),
    );
  }

  ThemeData darkColorTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colored.kCOLOR_1B262C, //1
      appBarTheme: AppBarTheme(
        backgroundColor: Colored.kCOLOR_0F4C75, //2
        titleTextStyle: Styles.textTheme(context).headlineMedium,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colored.kCOLOR_0F4C75, //3
          foregroundColor: Colored.kCOLOR_BBE1FA, //4
          disabledBackgroundColor: Colored.kCOLOR_BBE1FA, //4
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[AppColorTextRepeater.dark],
      unselectedWidgetColor: Colored.kCOLOR_BBE1FA, //4
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colored.kCOLOR_BBE1FA), //4
        fillColor: MaterialStateProperty.all(Colored.kCOLOR_0F4C75), //2
      ),
      indicatorColor: Colored.kCOLOR_BBE1FA, //4
      inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colored.kCOLOR_BBE1FA, //4
        ),
      )),
      iconTheme: const IconThemeData(color: Colored.kCOLOR_BBE1FA),//4
    );
  }

  ThemeData replyOrangeColorTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colored.kCOLOR_4A6572, //5
      appBarTheme: AppBarTheme(
        backgroundColor: Colored.kCOLOR_F9AA33, //2
        titleTextStyle: Styles.textTheme(context)
            .headlineMedium!
            .copyWith(color: Colored.kBLACK), //4
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colored.kCOLOR_F9AA33, //2
          foregroundColor: Colored.kBLACK, //4
          disabledBackgroundColor: Colored.kGRANIT35, //3
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[AppColorTextRepeater.replyOrange],
      unselectedWidgetColor: Colored.kBLACK, //4
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colored.kBLACK), //4
        fillColor: MaterialStateProperty.all(Colored.kCOLOR_F9AA33), //2
      ),
      indicatorColor: Colored.kBLACK, //4
      inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colored.kCOLOR_4A6572, //1
        ),
      )),
      iconTheme: const IconThemeData(color: Colored.kCOLOR_4A6572), //1
    );
  }

  ThemeData cranePurpleColorTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colored.kCOLOR_5D1049,
      appBarTheme: AppBarTheme(
        backgroundColor: Colored.kCOLOR_5D1049,
        titleTextStyle: Styles.textTheme(context).headlineMedium,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colored.kCOLOR_720D5D,
          foregroundColor: Colored.kWHITE, //4
          disabledBackgroundColor: Colored.kGRANIT35, //Colors.grey, //4
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[AppColorTextRepeater.cranePurple],
      unselectedWidgetColor: Colored.kWHITE,
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colored.kWHITE),
        fillColor: MaterialStateProperty.all(Colored.kCOLOR_720D5D),
      ),
      indicatorColor: const Color(0xff000000),
      inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colored.kCOLOR_E30425,
        ),
      )),
      iconTheme: const IconThemeData(color: Colored.kCOLOR_E30425),// colorScheme: ColorScheme(background: Colored.kWHITE),
    );
  }

  ThemeData setOtherTheme({
    // МОЖНО УДАЛИТЬ ИЛИ ЗАПУСТИТЬ?!!
    required BuildContext context,
    required Color mColor,
    required Color mColor2,
    required Color mColor3,
    required Color mColor4,
  }) {
    return ThemeData(
      primaryColor: mColor,
      scaffoldBackgroundColor: mColor,
      appBarTheme: AppBarTheme(
        backgroundColor: mColor2,
        titleTextStyle: TextStyle(
            color: mColor, //1
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: mColor3, //3
          foregroundColor: mColor4, //4
          disabledBackgroundColor: mColor4, //4
        ),
      ), //3
      unselectedWidgetColor: mColor4,
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(mColor4), //4
        fillColor: MaterialStateProperty.all(mColor2), //2
      ),
      indicatorColor: mColor4,
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: mColor4,
        ),
      )),
      iconTheme: IconThemeData(color: mColor4), //colorScheme: ColorScheme(error: mColor3),
    );
  }

  static const _defTextStyle = TextStyle();

  static TextTheme textTheme(BuildContext context) {
    return TextTheme(
      labelMedium: _defTextStyle.copyWith(
          fontSize: 16, color: Theme.of(context).indicatorColor),
      bodySmall: _defTextStyle.copyWith(
          fontSize: 13, color: Theme.of(context).unselectedWidgetColor),
      bodyLarge: _defTextStyle.copyWith(
          fontSize: 16, color: Theme.of(context).indicatorColor),
      headlineMedium: _defTextStyle.copyWith(
          color: Colored.kWHITE70, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
