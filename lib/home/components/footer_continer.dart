
import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class FooterContiner extends StatelessWidget {
  final bool isWebBody;
  const FooterContiner({
    this.isWebBody = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isWebBody
            ? getProportionateScreenWidth(150)
            : getProportionateScreenWidth(60),
      ),
      width: double.infinity,
      height: getProportionateScreenHeight(200),
      color: Colors.transparent.withOpacity(0.5),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            // height: getProportionateScreenHeight(70),
            child: Text(
              'COPYRIGHT (C) 2015 SONGHYUN INVESTMENT ALL RIGHTS RESERVED',
              style: TextStyle(fontSize: 11, color: AppColors.kWhite),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          isWebBody
              ? Image.asset(Assets.imagesLogoFooterEng)
              : const SizedBox.shrink(),
          Image.asset(Assets.imagesBtnKorean),
        ],
      ),
    );
  }
}
