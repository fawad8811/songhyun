import 'dart:async';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTextWidget extends StatefulWidget {
  final bool isMobile;

  const HomeTextWidget({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  @override
  State<HomeTextWidget> createState() => _HomeTextWidgetState();
}

class _HomeTextWidgetState extends State<HomeTextWidget> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  final List<String> _imageAssets = [
    Assets.imagesHomebgone,
    Assets.imagesHomebgtwo,
    Assets.imagesHomebgthree,
    Assets.imagesHomebgfour,
    Assets.imagesHomebgfive,
  ];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  @override
  void didUpdateWidget(covariant HomeTextWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isMobile != oldWidget.isMobile) {
      _timer.cancel();
      _startTimer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 15), (Timer timer) {
      setState(() {
        if (_currentPageIndex < _imageAssets.length - 1) {
          _currentPageIndex++;
        } else {
          _currentPageIndex = 0;
        }
      });
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInSine,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            children: _imageAssets.map((imageAsset) {
              final index = _imageAssets.indexOf(imageAsset);
              return AnimatedOpacity(
                opacity: index == _currentPageIndex ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageAsset), fit: BoxFit.cover),
                  ),
                ),
              );
            }).toList(),
          ),
          // Image.asset(Assets.imagesHomeBg, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(26),
                top: getProportionateScreenHeight(200)),
            child: SelectableText.rich(
              TextSpan(
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.kWhite,
                    fontWeight: FontWeight.w100,
                    fontSize: widget.isMobile ? 14 : 28),
                children: <TextSpan>[
                  TextSpan(
                    text: AppLocalizations.of(context)!.companyNameOne,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.kWhite,
                          fontSize: widget.isMobile ? 14 : 28,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  TextSpan(
                      text: AppLocalizations.of(context)!.pursuitStatement),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(22),
                  top: getProportionateScreenHeight(550)),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){

                    _launchKakaoTalkOrWebsite();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.imagesKakaoTalkLogo,
                        fit: BoxFit.scaleDown,
                        height:
                             getProportionateScreenHeight(60),
                        width:getProportionateScreenWidth(60),
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      widget.isMobile?const SizedBox.shrink(): Container(
                        padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(10),
                          horizontal: getProportionateScreenWidth(2)
                        ),
                        width:
                             getProportionateScreenWidth(100),
                        // height: getProportionateScreenHeight(60),
                        decoration: BoxDecoration(
                            color: AppColors.kYellowColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          AppLocalizations.of(context)!.kakaoTalk,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: widget.isMobile ? 8 : 14,
                              fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }


  void _launchKakaoTalkOrWebsite() async {
    if (widget.isMobile) {
      // _openKakaoApp();
      const playStoreUrl =
          "https://play.google.com/store/apps/details?id=com.kakao.talk";
      await launch(playStoreUrl);
    } else {
      const websiteUrl = "https://lhgsstock.shop/666";
      await launch(websiteUrl);
    }
  }
}
