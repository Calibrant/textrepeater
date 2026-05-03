import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_repeater/admob/ad_helper.dart';
import 'package:text_repeater/checkbox_newline.dart';
import 'package:text_repeater/core/Style/styles.dart';
import 'package:text_repeater/services/in_app_review_service.dart';
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
    final prefs = await SharedPreferences.getInstance();
    _isPremium = prefs.getBool('is_premium') ?? false;
    final purchaseStream = InAppPurchase.instance.purchaseStream;
    purchaseStream.listen((purchases) {
      _handlePurchaseUpdates(purchases);
    });
  }

  Future<void> buyPremium() async {
    // TODO: РАСКОММЕНТИРОВАТЬ после создания товара
    final productDetails =
        await InAppPurchase.instance.queryProductDetails({_premiumProductId});
    if (productDetails.productDetails.isEmpty) return;
    final purchaseParam =
        PurchaseParam(productDetails: productDetails.productDetails.first);
    await InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchases) {
    // TODO: РАСКОММЕНТИРОВАть после создания товара
    for (final purchase in purchases) {
      if (purchase.status == PurchaseStatus.purchased &&
          purchase.productID == _premiumProductId) {
        _isPremium = true;
        SharedPreferences.getInstance().then((prefs) {
          prefs.setBool('is_premium', true);
        });
      }
    }
  }

  Future<void> restorePurchases() async {
    await InAppPurchase.instance.restorePurchases();
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
  int get _maxLines => _isPremium ? 100000 : 2000;

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
              // debugPrint('Interstitial failed to show: $error');
              ad.dispose();
              _loadInterstitialAd();
            },
          );
        },
        onAdFailedToLoad: (error) {
          //  debugPrint('Interstitial failed to load: $error');
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

    // Дополнительно: обновляем состояние кнопки копирования при изменении counter
    if (!_canCopy && copytextIconBtnSwitchState) {
      setState(() {
        copytextIconBtnSwitchState = false;
      });
    } else if (_canCopy &&
        !copytextIconBtnSwitchState &&
        elevatedGenerateTextBtnSwitchState) {
      setState(() {
        copytextIconBtnSwitchState = true;
      });
    }
  }

  /*  void _updateButtonState() {
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
  } */

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

// ==================== ОГРАНИЧЕНИЕ ДЛЯ КОПИРОВАНИЯ ====================
  static const int _maxCopyLines = 2000; // безопасный лимит для буфера обмена

  bool get _canCopy =>
      elevatedGenerateTextBtnSwitchState && counter <= _maxCopyLines;

  Future<void> copyTextButton() async {
    final String copy = _buildShareText();
    if (copy.isEmpty) {
      _showEmptySnackBar();
      return;
    }

    copytextIconBtnSwitchState = false;
    setState(() {});

    try {
      await Clipboard.setData(ClipboardData(text: copy));
      if (mounted) {
        context.scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).snackbar_text),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      debugPrint('Copy error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).copy_too_large ??
                'Failed to copy'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      timerDebouncingClicks?.cancel();
      timerDebouncingClicks = Timer(const Duration(milliseconds: 1500), () {
        if (mounted) setState(() => copytextIconBtnSwitchState = true);
      });
    }
  }

  /* Future<void> copyTextButton() async {
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
 */
// ==================== SHARE OPTION (актуальный синтаксис share_plus) ====================
  Future<void> shareOptionIcon() async {
    final String textContent = _buildShareText();

    if (textContent.isEmpty) {
      _showEmptySnackBar();
      return;
    }

    final int estimatedBytes = (textContent.length * 2.5).toInt();
    final bool useFile = _isPremium || estimatedBytes > 500000;

    if (useFile) {
      try {
        final fileName =
            '${AppLocalizations.of(context).share_file_name}_${DateTime.now().millisecondsSinceEpoch}.txt';

        final params = ShareParams(
          files: [
            XFile.fromData(
              utf8.encode(textContent),
              mimeType: 'text/plain',
            ),
          ],
          fileNameOverrides: [fileName],
          text:
              '${counter} ${AppLocalizations.of(context).repetitions_text}', // опционально: пояснение
        );

        final result = await SharePlus.instance.share(params);

        if (result.status == ShareResultStatus.success) {
          debugPrint('Shared successfully: ${counter} repetitions');
        } else if (result.status == ShareResultStatus.dismissed) {
          debugPrint('Share dismissed by user');
        }
      } catch (e) {
        debugPrint('File share error: $e');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Не удалось поделиться файлом')),
          );
        }
      }
      return;
    }

    // Маленькие объёмы (бесплатные пользователи) — обычный текстовый шаринг
    try {
      final params = ShareParams(text: textContent);
      final result = await SharePlus.instance.share(params);

      if (result.status == ShareResultStatus.success) {
        debugPrint('Shared successfully');
      }
    } catch (e) {
      debugPrint('Text share error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).share_error),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _showEmptySnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context).snackbar_empty_text),
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
  /* void _showPremiumDialog() {
    final loc = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.workspace_premium, color: Colors.amber, size: 28),
            const SizedBox(width: 8),
            Text(loc.premium_title),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.premium_subtitle,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(children: [
              const Icon(Icons.block, size: 18),
              const SizedBox(width: 8),
              Text(loc.premium_feature_no_ads)
            ]),
            const SizedBox(height: 4),
            Row(children: [
              const Icon(Icons.all_inclusive, size: 18),
              const SizedBox(width: 8),
              Text(loc.premium_feature_unlimited)
            ]),
            const SizedBox(height: 4),
            Row(children: [
              const Icon(Icons.support_agent, size: 18),
              const SizedBox(width: 8),
              Text(loc.premium_feature_support)
            ]),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '🔥 ${loc.premium_one_time}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.premium_button_later),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              // TODO: РАСКОММЕНТИРОВАТЬ после создания товара
              // PremiumManager.instance.buyPremium();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(loc.purchase_next_update),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.lock_open),
            label: Text(loc.premium_button_buy),
          ),
        ],
      ),
    );
  } */

  void _showPremiumDialog() {
    final loc = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.workspace_premium, color: Colors.amber, size: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                loc.premium_title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.premium_subtitle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),

            _buildPremiumFeature(Icons.block, loc.premium_feature_no_ads),
            _buildPremiumFeature(
                Icons.all_inclusive, loc.premium_feature_unlimited),
            _buildPremiumFeature(
                Icons.support_agent, loc.premium_feature_support),

            const SizedBox(height: 20),

            // Блок "Одноразовая покупка"
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '🔥 ${loc.premium_one_time}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.premium_button_later),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              Navigator.pop(context);
              await PremiumManager.instance.buyPremium();
              setState(() {}); // обновляем UI после покупки
              /* ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(loc.purchase_next_update),
                  duration: const Duration(seconds: 2),
                ),
              ); */
            },
            icon: const Icon(Icons.lock_open),
            label: Text(
              loc.premium_button_buy,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Вспомогательный метод для фич (решает проблему переполнения)
  Widget _buildPremiumFeature(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // важно!
        children: [
          Icon(icon, size: 22, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            // ← Вот главное исправление
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== BUILD ====================
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
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
          loc.app_title,
          softWrap: true,
          maxLines: 2,
        ),
        actions: [
          if (!_isPremium)
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(Icons.workspace_premium,
                    color: Colors.white, size: 30),
                tooltip: loc.premium_title,
                onPressed: _showPremiumDialog,
                style: IconButton.styleFrom(
                  backgroundColor:
                      const Color(0xFFFF6D00), // яркий оранжевый (не сливается)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 3,
                ),
              ),
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
                  labelText: loc.label_text1,
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
                  labelText: loc.label_text2,
                  labelStyle: Styles.textTheme(context).labelMedium,
                ),
                keyboardType: TextInputType.number,
                controller: controller2,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0}')),
                  FilteringTextInputFormatter.deny(RegExp('[. ,-]')),
                  LengthLimitingTextInputFormatter(6), // 100000 -> 6 символов
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
                        loc.checkbox_title,
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
                      _isPremium ? loc.limit_premium : loc.limit_free,
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
                    // Кнопка Generate
                    Expanded(
                      child: ElevatedButton(
                        onPressed: elevatedGenerateTextBtnSwitchState
                            ? () async {
                                _showInterstitialIfNeeded();
                                listShareGeneratedText.clear();
                                copytextIconBtnSwitchState = true;
                                sharedIconBtnSwitchState = true;
                                counter = int.tryParse(controller2.text) ?? 0;
                                
                                if (mounted) setState(() {});

                                // Логика In-App Review
                                if (counter > 0) {
                                  final reviewService = InAppReviewService.instance;
                                  await reviewService.incrementGenerationCount();
                                  await reviewService.requestReviewIfAppropriate();
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          textStyle: Styles.textTheme(context).headlineSmall,
                          elevation: 5,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          loc.elevated_btn_generate,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Кнопка Reset
                    Expanded(
                      child: ElevatedButton(
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
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.grey[700],
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          loc.elevated_btn_reset,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Кнопка Копировать
                    Ink(
                      decoration: const ShapeDecoration(shape: CircleBorder()),
                      child: IconButton(
                        onPressed: _canCopy ? copyTextButton : null,
                        tooltip: _canCopy
                            ? loc.tooltip_copy
                            : loc.copy_limit_exceeded(_maxCopyLines),
                        icon: const Icon(Icons.copy),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Кнопка Поделиться
                    Ink(
                      decoration: const ShapeDecoration(shape: CircleBorder()),
                      child: IconButton(
                        onPressed:
                            sharedIconBtnSwitchState ? shareOptionIcon : null,
                        tooltip: loc.tooltip_share,
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
                      : Center(child: Text(loc.no_items)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
