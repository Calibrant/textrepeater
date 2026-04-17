import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_repeater/admob/ad_helper.dart';
import 'package:text_repeater/checkbox_newline.dart';
import 'package:text_repeater/core/Style/styles.dart';
import 'package:text_repeater/custom_drawer.dart';
import 'package:text_repeater/generated/l10n.dart';
import 'package:text_repeater/language_switcher.dart';
import 'package:text_repeater/numerical_range_formatter.dart';
import 'package:text_repeater/popupmenu.dart';
import 'package:text_repeater/themeextension_mycolor.dart';

class TextRepeater extends StatefulWidget {
  const TextRepeater({super.key});
  //final String title;
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

  late BannerAd _bottomBannerAd;
  bool _isBottomBannerAdLoaded = false;

  int counter = 0;
  final String lineBreakGeneratedText = '\n';
  final List<String> listShareGeneratedText = <String>[];
  bool checkboxSwitchState = false;
  late bool copytextIconBtnSwitchState;
  Timer? timerDebouncingClicks;
  late bool sharedIconBtnSwitchState;
  bool elevatedGenerateTextBtnSwitchState = true;
  final model = Styles();

  void _createBottomBannerAd() {
    _bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBottomBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    _bottomBannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller2 = TextEditingController();
    timerDebouncingClicks?.cancel();
    copytextIconBtnSwitchState = false;
    sharedIconBtnSwitchState = false;
    elevatedGenerateTextBtnSwitchState = false;
  }

  @override
  void didChangeDependencies() {
    _createBottomBannerAd();
    super.didChangeDependencies();
  }

  void onTap() {
    controller.clear();
    controller2.clear();
    listShareGeneratedText.clear();
    counter = 0;
  }

  @override
  void dispose() {
    _bottomBannerAd.dispose();
    controller.dispose();
    controller2.dispose();
    timerDebouncingClicks?.cancel();
    super.dispose();
  }

  Future<void> copyTextButton() async {
    String copy = '';
    copytextIconBtnSwitchState = false;

    for (var element in listShareGeneratedText) {
      if (checkboxSwitchState == false) {
        copy += '$element, ';
      } else {
        copy += '$element\n';
      }
    }
    await Clipboard.setData(ClipboardData(text: copy)).then((value) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      return context.scaffoldMessenger
          .showSnackBar(SnackBar(content: Text(S.of(context).snackbar_text)));
    });
    timerDebouncingClicks = Timer(const Duration(milliseconds: 1500),
        () => copytextIconBtnSwitchState = true);
  }

  Future<void> shareOptionIcon() async {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    String str = '';
    for (var element in listShareGeneratedText) {
      if (checkboxSwitchState == false) {
        str += '$element, ';
      } else {
        str += '$element\n';
      }
    }
    await Share.share(str);
  }

  Text textLineBreak() {
    listShareGeneratedText.add(controller.text);
    return Text(
      '${controller.text}$lineBreakGeneratedText'.trim(),
      style: Styles.textTheme(context).bodyLarge,
    );
  }

  Text textNoLineBreak() {
    listShareGeneratedText.add(controller.text);
    return Text(
      controller.text,
      style: Styles.textTheme(context).bodyLarge,
    );
  }

  //! BUILD
  @override
  Widget build(BuildContext context) {
    //! SCAFFOLD
    return Scaffold(
      bottomNavigationBar: _isBottomBannerAdLoaded
          ? SizedBox(
              height: _bottomBannerAd.size.height.toDouble(),
              width: _bottomBannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bottomBannerAd),
            )
          : null,
      drawer: const CustomDrawer(),
      onDrawerChanged: (value) {
        if (value) {
          setState(() => _isBottomBannerAdLoaded = false);
        } else {
          setState(() {
            _bottomBannerAd.load();
            _isBottomBannerAdLoaded = true;
          });
        }
      },
      backgroundColor: context.theme.colorScheme.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          S.of(context).app_title,
          softWrap: true,
          maxLines: 2,
        ),
        actions: const <Widget>[
          LocaleLanguageSwitcherWidget(),
          PopupMenu(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                //! TEXT FIELD
                minLines: 1,
                maxLines: 4,
                onChanged: (newState) {
                  setState(() {
                    if (controller.text.trim().isNotEmpty &&
                        controller2.text.trim().isNotEmpty) {
                      elevatedGenerateTextBtnSwitchState = true;
                    } else {
                      elevatedGenerateTextBtnSwitchState = false;
                      copytextIconBtnSwitchState = false;
                      sharedIconBtnSwitchState = false;
                    }
                    listShareGeneratedText.clear();
                  });
                },
                decoration: InputDecoration(
                    labelText: S.of(context).label_text1,
                    labelStyle: Styles.textTheme(context).labelMedium),
                controller: controller,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                style: Styles.textTheme(context).bodyLarge,
              ),
              TextFormField(
                //! COUNTER FIELD
                onChanged: (newState) {
                  setState(() {
                    if (controller.text.trim().isNotEmpty &&
                        controller2.text.trim().isNotEmpty) {
                      elevatedGenerateTextBtnSwitchState = true;
                    } else {
                      elevatedGenerateTextBtnSwitchState = false;
                      copytextIconBtnSwitchState = false;
                      sharedIconBtnSwitchState = false;
                    }
                  });
                  counter = 0;
                },
                decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: S.of(context).label_text2,
                    labelStyle: Styles.textTheme(context).labelMedium),
                keyboardType: TextInputType.number,
                controller: controller2,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0}')),
                  FilteringTextInputFormatter.deny(RegExp('[. ,-]')),
                  LengthLimitingTextInputFormatter(4),
                  NumericalRangeFormatter(min: 1, max: 1000),
                ],
                style: Styles.textTheme(context).bodyLarge,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    //! CHECKBOX
                    child: CheckboxNewline(
                        label: Text(
                          S.of(context).checkbox_title,
                          style: Styles.textTheme(context).labelMedium,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        value: timeDilation != 1.0,
                        onChanged: (bool newLine) {
                          setState(() {
                            timeDilation = newLine ? 2.5 : 1.0;
                            listShareGeneratedText.clear();
                            checkboxSwitchState = newLine;
                          });
                        }),
                  ),
                  Container(
                    //! MAX 1000 STRING
                    decoration: BoxDecoration(
                        color: context.color.danger,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    padding: const EdgeInsets.all(4),
                    child: Text(S.of(context).text_max1000,
                        style: Styles.textTheme(context).bodySmall),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        //! GENERATE BUTTON
                        onPressed: elevatedGenerateTextBtnSwitchState
                            ? () {
                                copytextIconBtnSwitchState = true;
                                sharedIconBtnSwitchState = true;
                                setState(() {});
                                counter = int.tryParse(controller2.text) ?? 0;
                                listShareGeneratedText.clear();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                            textStyle: Styles.textTheme(context).headlineSmall,
                            elevation: 5.0),
                        child: Text(
                          S.of(context).elevated_btn_generate,
                        )),
                    ElevatedButton(
                        //! RESET BUTTON
                        onPressed: () {
                          setState(() {
                            onTap();
                            copytextIconBtnSwitchState = false;
                            sharedIconBtnSwitchState = false;
                            elevatedGenerateTextBtnSwitchState = false;
                            checkboxSwitchState = false;
                            timeDilation = 1.0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            textStyle: Styles.textTheme(context).headlineSmall,
                            elevation: 5.0),
                        child: Text(S.of(context).elevated_btn_reset)),
                    Ink(
                      //! COPY ICONBUTTON
                      decoration: const ShapeDecoration(shape: CircleBorder()),
                      child: IconButton(
                          onPressed: () {
                            copytextIconBtnSwitchState
                                ? copyTextButton()
                                : null;
                          },
                          tooltip: S.of(context).tooltip_copy,
                          icon: const Icon(
                            Icons.copy,
                          )),
                    ),
                    Ink(
                      //! SHARE ICONBUTTON
                      decoration: const ShapeDecoration(shape: CircleBorder()),
                      child: IconButton(
                          onPressed: () => sharedIconBtnSwitchState
                              ? shareOptionIcon()
                              : null,
                          tooltip: S.of(context).tooltip_share,
                          icon: const Icon(
                            Icons.share_rounded,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                //! RESULT GENERATE
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: counter > 0
                        ? checkboxSwitchState
                            ? ListView.builder(
                                itemCount: counter,
                                itemBuilder: (context, index) =>
                                    textLineBreak())
                            : ListView.builder(
                                itemCount: counter,
                                itemBuilder: (context, index) =>
                                    textNoLineBreak())
                        : const Text('No items')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}