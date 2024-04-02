import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class KakaoTalkButton extends StatefulWidget {
  final bool isMobile;

  const KakaoTalkButton({super.key, this.isMobile = false});

  @override
  State<KakaoTalkButton> createState() => _KakaoTalkButtonState();
}

class _KakaoTalkButtonState extends State<KakaoTalkButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchKakaoTalkOrWebsite();
        // openKakaoTalk();
      },
      child: Container(
          width: widget.isMobile
              ? getProportionateScreenWidth(35)
              : getProportionateScreenWidth(10),
          height: widget.isMobile
              ? getProportionateScreenHeight(40)
              : getProportionateScreenHeight(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent),
          child: SvgPicture.asset(Assets.imagesKakaoTalkLogo)),
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
