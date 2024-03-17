import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class HomeBottomWidget extends StatelessWidget {
  const HomeBottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 500,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(150),
          vertical: getProportionateScreenHeight(
              10), // Adjust vertical spacing as needed
        ),
        width: SizeConfig.screenWidth,
        color: AppColors.kBlack.withOpacity(0.6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'COPYRIGHT (C) 2015 SONGHYUN INVESTMENT ALL RIGHTS RESERVED',
              style: TextStyle(fontSize: 11, color: AppColors.kWhite),
              textAlign: TextAlign.center, // Align text in the center
            ),
            SizedBox(
                height: getProportionateScreenHeight(
                    10)), // Add some vertical spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesLogoFooterEng),
                SizedBox(width: getProportionateScreenWidth(20)),
                Image.asset(Assets.imagesBtnKorean),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
