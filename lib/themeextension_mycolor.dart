// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:text_repeater/repeater_text_app_core/text_repeater_style/colors.dart';

//import 'Style/styles.dart';

class AppColorTextRepeater extends ThemeExtension<AppColorTextRepeater> {
  final Color? danger;
  AppColorTextRepeater({
    Key? key,
    this.danger,
  });

  @override
  ThemeExtension<AppColorTextRepeater> copyWith({Color? danger}) {
    return AppColorTextRepeater(danger: danger ?? this.danger);
  }

  @override
  ThemeExtension<AppColorTextRepeater> lerp(
      ThemeExtension<AppColorTextRepeater>? other, double t) {
    if (other is! AppColorTextRepeater) {
      return this;
    }
    return AppColorTextRepeater(danger: Color.lerp(danger, other.danger, t));
  }

  static get white => AppColorTextRepeater(danger: Colored.kDODGERBLUE);
  static get dark => AppColorTextRepeater(danger: Colored.kCOLOR_0F4C75);
  static get replyOrange => AppColorTextRepeater(danger: Colored.kCOLOR_F9AA33);
  static get cranePurple => AppColorTextRepeater(danger: Colored.kCOLOR_720D5D);

  @override
  String toString() => 'MyColor(danger color: $danger)';
}

extension BuildContextExt on BuildContext {
  AppColorTextRepeater get color =>
      Theme.of(this).extension<AppColorTextRepeater>()!;
}
