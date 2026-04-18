import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
     // return "ca-app-pub-3940256099942544/2934735716"; // демо-объявления Google
      return "ca-app-pub-3940256099942544/6300978111"; // Тестовый код
     // return "ca-app-pub-2717584945928240/3508714566"; // Рабочий код
    } else if (Platform.isIOS) {
      return "ca-app-pub-2717584945928240/3508714566";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
  static String get interstitialAdUnitId {
    // Добавьте ID для межстранички (создайте новый блок в AdMob)
   // return 'ca-app-pub-3940256099942544/4411468910'; // демо-объявления Google
    return 'ca-app-pub-3940256099942544/1033173712'; // Тестовый код
   // return 'ca-app-pub-2717584945928240/9297225533'; // Рабочий код код
  }
}
