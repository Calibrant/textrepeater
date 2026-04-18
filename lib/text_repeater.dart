import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_repeater/admob/ad_helper.dart';
import 'package:text_repeater/checkbox_newline.dart';
import 'package:text_repeater/core/Style/styles.dart';
import 'package:text_repeater/custom_drawer.dart';
import 'package:text_repeater/l10n/app_localizations.dart';
import 'package:text_repeater/language_switcher.dart';
import 'package:text_repeater/numerical_range_formatter.dart';
import 'package:text_repeater/popupmenu.dart';
import 'package:text_repeater/themeextension_mycolor.dart';

// ═══════════════════════════════════════════════════════════════════════════
// 🎯 PREMIUM MANAGER (временно без покупок, только флаг для разработки)
// ═══════════════════════════════════════════════════════════════════════════
class PremiumManager {
  static final PremiumManager instance = PremiumManager._internal();
  PremiumManager._internal();

  // ⚠️ ВРЕМЕННО: для теста можно поставить true, чтобы увидеть, как будет выглядеть премиум
  // В релизе — всегда false, пока пользователь не купит
  bool _isPremium = false;
  bool get isPremium => _isPremium;

  // 🔧 TODO: После получения ID товара из Google Play Console:
  // 1. Заменить 'ad_free_unlimited' на реальный ID
  // 2. Раскомментировать код в init() и buyPremium()
  static const String _premiumProductId = 'ad_free_unlimited';

  Future<void> init() async {
    // TODO: РАСКОММЕНТИРОВАТЬ после создания товара в Google Play Console
    // final prefs = await SharedPreferences.getInstance();
    // _isPremium = prefs.getBool('is_premium') ?? false;
    //
    // final purchaseStream = InAppPurchase.instance.purchaseStream;
    // purchaseStream.listen((purchases) {
    //   _handlePurchaseUpdates(purchases);
    // });
  }

  Future<void> buyPremium() async {
    // TODO: РАСКОММЕНТИРОВАТЬ после создания товара
    // final productDetails = await InAppPurchase.instance.queryProductDetails({_premiumProductId});
    // if (productDetails.productDetails.isEmpty) return;
    // final purchaseParam = PurchaseParam(productDetails: productDetails.productDetails.first);
    // await InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchases) {
    // TODO: РАСКОММЕНТИРОВАть после создания товара
    // for (final purchase in purchases) {
    //   if (purchase.status == PurchaseStatus.purchased && purchase.productID == _premiumProductId) {
    //     _isPremium = true;
    //     SharedPreferences.getInstance().then((prefs) {
    //       prefs.setBool('is_premium', true);
    //     });
    //   }
    // }
  }

  // Временный метод для тестирования премиум UI (удалить перед релизом)
  void debugSetPremium(bool value) {
    _isPremium = value;
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 📱 ОСНОВНОЙ КЛАСС ПРИЛОЖЕНИЯ
// ═══════════════════════════════════════════════════════════════════════════
class TextRepeater extends StatefulWidget {
  const TextRepeater({super.key});

  @override
  State<TextRepeater> createState() => _TextRepeaterState();
}

extension BuildContextExtension on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  ThemeData get theme => Theme.of(this);
}

class _TextRepeaterState extends State<TextRepeater> {
  late TextEditingController controller;
  late TextEditingController controller2;

  // ==================== БАННЕР ====================
  BannerAd? _mainBannerAd;
  bool _isMainBannerAdLoaded = false;
  bool _isAdLoading = false;

  // ==================== INTERSTITIAL ====================
  InterstitialAd? _interstitialAd;
  int _generateCount = 0;

  // ==================== Логика приложения ====================
  int counter = 0;
  bool checkboxSwitchState = false;
  bool copytextIconBtnSwitchState = false;
  bool sharedIconBtnSwitchState = false;
  bool elevatedGenerateTextBtnSwitchState = false;

  Timer? timerDebouncingClicks;
  final List<String> listShareGeneratedText = <String>[];

  // ==================== PREMIUM ====================
  bool get _isPremium => PremiumManager.instance.isPremium;

  // Максимальное количество строк (зависит от премиума)
  int get _maxLines => _isPremium ? 50000 : 2000;

  // ==================== ЗАГРУЗКА РЕКЛАМЫ ====================
  void _loadInterstitialAd() {
    // Если премиум — не загружаем рекламу вообще
    if (_isPremium) return;

    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          if (!mounted) return;
          _interstitialAd = ad;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _loadInterstitialAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint('Interstitial failed to show: $error');
              ad.dispose();
              _loadInterstitialAd();
            },
          );
        },
        onAdFailedToLoad: (error) {
          debugPrint('Interstitial failed to load: $error');
          _interstitialAd = null;
        },
      ),
    );
  }

  void _loadMainBannerAd() {
    // Если премиум — не загружаем баннер
    if (_isPremium || _isAdLoading || _mainBannerAd != null) return;

    _isAdLoading = true;

    _mainBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (!mounted) return;
          setState(() {
            _isMainBannerAdLoaded = true;
            _isAdLoading = false;
          });
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
          _mainBannerAd = null;
          _isAdLoading = false;
        },
      ),
    );
    _mainBannerAd?.load();
  }

  void _showInterstitialIfNeeded() {
    if (_isPremium) return; // Премиум — рекламы нет
    _generateCount++;
    if (_generateCount % 3 == 0 && _interstitialAd != null) {
      _interstitialAd!.show();
    }
  }

  // ==================== LIFECYCLE ====================
  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    controller2 = TextEditingController();

    controller.addListener(_updateButtonState);
    controller2.addListener(_updateButtonState);

    copytextIconBtnSwitchState = false;
    sharedIconBtnSwitchState = false;
    elevatedGenerateTextBtnSwitchState = false;

    // Инициализация премиум-менеджера
    PremiumManager.instance.init();

    _loadInterstitialAd();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMainBannerAd();
    });
  }

  void _updateButtonState() {
    final bool canGenerate =
        controller.text.trim().isNotEmpty && controller2.text.trim().isNotEmpty;

    if (elevatedGenerateTextBtnSwitchState != canGenerate) {
      setState(() {
        elevatedGenerateTextBtnSwitchState = canGenerate;
        if (!canGenerate) {
          copytextIconBtnSwitchState = false;
          sharedIconBtnSwitchState = false;
        }
      });
    }
  }

  @override
  void dispose() {
    _mainBannerAd?.dispose();
    _interstitialAd?.dispose();
    controller.dispose();
    controller2.dispose();
    timerDebouncingClicks?.cancel();
    super.dispose();
  }

  // ==================== BUILD BANNER ====================
  Widget _buildBanner() {
    if (_isPremium) return const SizedBox.shrink(); // Премиум — нет баннера
    if (!_isMainBannerAdLoaded || _mainBannerAd == null) {
      return const SizedBox(height: 52);
    }
    return SizedBox(
      height: _mainBannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _mainBannerAd!),
    );
  }

  // ==================== SHARE & COPY ====================
  String _buildShareText() {
    final String inputText = controller.text.trim();
    if (inputText.isEmpty || counter <= 0) return '';

    final String separator = checkboxSwitchState ? '\n' : ', ';
    final buffer = StringBuffer();

    for (int i = 0; i < counter; i++) {
      buffer.write(inputText);
      if (i < counter - 1) {
        buffer.write(separator);
      }
    }
    return buffer.toString().trimRight();
  }

  Future<void> copyTextButton() async {
    final String copy = _buildShareText();
    if (copy.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).snackbar_empty_text ??
              'Нечего копировать'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    copytextIconBtnSwitchState = false;

    await Clipboard.setData(ClipboardData(text: copy));

    context.scaffoldMessenger.showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context).snackbar_text)),
    );

    timerDebouncingClicks?.cancel();
    timerDebouncingClicks = Timer(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => copytextIconBtnSwitchState = true);
    });
  }

  Future<void> shareOptionIcon() async {
    final String str = _buildShareText();
    if (str.isEmpty) {
      _showEmptySnackBar();
      return;
    }

    final int estimatedBytes = (str.length * 2.5).toInt();
    if (estimatedBytes > 550000) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Текст слишком большой для шаринга (${counter} повторений).\n'
            'Используйте кнопку «Копировать».',
          ),
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          action:
              SnackBarAction(label: 'Копировать', onPressed: copyTextButton),
        ),
      );
      return;
    }

    try {
      await SharePlus.instance.share(ShareParams(text: str));
    } catch (e) {
      debugPrint('Share error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось открыть окно шаринга')),
      );
    }
  }

  void _showEmptySnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context).snackbar_empty_text ??
            'Нечем поделиться, гуляй Вася'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void onTap() {
    controller.clear();
    controller2.clear();
    listShareGeneratedText.clear();
    counter = 0;
  }

  // ==================== PREMIUM BUTTON ====================
  void _showPremiumDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.workspace_premium, color: Colors.amber, size: 28),
            SizedBox(width: 8),
            Text('Text Repeater PRO'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Что вы получите:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Row(children: [
              Icon(Icons.block, size: 18),
              SizedBox(width: 8),
              Text('Полное удаление рекламы')
            ]),
            const SizedBox(height: 4),
            const Row(children: [
              Icon(Icons.all_inclusive, size: 18),
              SizedBox(width: 8),
              Text('До 50 000 повторений за раз')
            ]),
            const SizedBox(height: 4),
            const Row(children: [
              Icon(Icons.support_agent, size: 18),
              SizedBox(width: 8),
              Text('Приоритетная поддержка')
            ]),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '🔥 Одноразовая покупка — навсегда!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Позже'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              // TODO: РАСКОММЕНТИРОВАТЬ после создания товара
              // PremiumManager.instance.buyPremium();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Покупка будет доступна после обновления приложения'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.lock_open),
            label: const Text('Купить PRO — \$3.99'),
          ),
        ],
      ),
    );
  }

  // ==================== BUILD ====================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      onDrawerChanged: (isOpened) {
        if (isOpened) {
          setState(() => _isMainBannerAdLoaded = false);
        } else {
          setState(() => _isMainBannerAdLoaded = true);
        }
      },
      backgroundColor: context.theme.colorScheme.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).app_title,
          softWrap: true,
          maxLines: 2,
        ),
        actions: [
          // 🎯 КНОПКА PREMIUM (КОРОНА)
          if (!_isPremium)
            IconButton(
              icon: const Icon(Icons.workspace_premium, color: Colors.amber),
              tooltip: 'Text Repeater PRO — без рекламы',
              onPressed: _showPremiumDialog,
            ),
          const LocaleLanguageSwitcherWidget(),
          const PopupMenu(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).label_text1,
                  labelStyle: Styles.textTheme(context).labelMedium,
                ),
                controller: controller,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                style: Styles.textTheme(context).bodyLarge,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: AppLocalizations.of(context).label_text2,
                  labelStyle: Styles.textTheme(context).labelMedium,
                ),
                keyboardType: TextInputType.number,
                controller: controller2,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0}')),
                  FilteringTextInputFormatter.deny(RegExp('[. ,-]')),
                  LengthLimitingTextInputFormatter(5), // 50000 -> 5 символов
                  NumericalRangeFormatter(
                      min: 1, max: _maxLines), // динамический лимит!
                ],
                style: Styles.textTheme(context).bodyLarge,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CheckboxNewline(
                      label: Text(
                        AppLocalizations.of(context).checkbox_title,
                        style: Styles.textTheme(context).labelMedium,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      value: checkboxSwitchState,
                      onChanged: (bool newLine) {
                        setState(() {
                          checkboxSwitchState = newLine;
                          listShareGeneratedText.clear();
                        });
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: context.color.danger,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      _isPremium ? 'До 50 000' : 'До ${_maxLines}',
                      style: Styles.textTheme(context).bodySmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildBanner(),
              const SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: elevatedGenerateTextBtnSwitchState
                          ? () {
                              _showInterstitialIfNeeded();
                              listShareGeneratedText.clear();
                              copytextIconBtnSwitchState = true;
                              sharedIconBtnSwitchState = true;
                              counter = int.tryParse(controller2.text) ?? 0;
                              setState(() {});
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        textStyle: Styles.textTheme(context).headlineSmall,
                        elevation: 5,
                      ),
                      child: Text(
                          AppLocalizations.of(context).elevated_btn_generate),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          onTap();
                          copytextIconBtnSwitchState = false;
                          sharedIconBtnSwitchState = false;
                          elevatedGenerateTextBtnSwitchState = false;
                          checkboxSwitchState = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: Styles.textTheme(context).headlineSmall,
                        elevation: 5,
                      ),
                      child:
                          Text(AppLocalizations.of(context).elevated_btn_reset),
                    ),
                    Ink(
                      decoration: const ShapeDecoration(shape: CircleBorder()),
                      child: IconButton(
                        onPressed:
                            copytextIconBtnSwitchState ? copyTextButton : null,
                        tooltip: AppLocalizations.of(context).tooltip_copy,
                        icon: const Icon(Icons.copy),
                      ),
                    ),
                    Ink(
                      decoration: const ShapeDecoration(shape: CircleBorder()),
                      child: IconButton(
                        onPressed:
                            sharedIconBtnSwitchState ? shareOptionIcon : null,
                        tooltip: AppLocalizations.of(context).tooltip_share,
                        icon: const Icon(Icons.share_rounded),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: counter > 0
                      ? ListView.builder(
                          itemCount: counter,
                          addAutomaticKeepAlives: false,
                          itemExtent: 28,
                          itemBuilder: (context, index) {
                            final text = controller.text;
                            return checkboxSwitchState
                                ? Text('${text}\n'.trim(),
                                    style: Styles.textTheme(context).bodyLarge)
                                : Text(text,
                                    style: Styles.textTheme(context).bodyLarge);
                          },
                        )
                      : const Center(child: Text('No items')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
