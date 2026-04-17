import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-2717584945928240/3508714566";
    } else if (Platform.isIOS) {
      return "ca-app-pub-2717584945928240/3508714566";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
