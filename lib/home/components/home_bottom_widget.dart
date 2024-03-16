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
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(150),
            right: getProportionateScreenWidth(150)),
        width: SizeConfig.screenWidth,
        height: getProportionateScreenHeight(70),
        color: AppColors.kBlack.withOpacity(0.6),
        child: Row(
          children: [
            const Text(
              'COPYRIGHT (C) 2015 SONGHYUN INVESTMENT ALL RIGHTS RESERVED',
              style: TextStyle(fontSize: 11, color: AppColors.kWhite),
            ),
            const Spacer(),
            Image.asset(Assets.imagesLogoFooterEng),
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
            Image.asset(Assets.imagesBtnKorean),
          ],
        ),
      ),
    );
  }
}
