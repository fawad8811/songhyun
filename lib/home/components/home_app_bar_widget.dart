import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: getProportionateScreenHeight(90),
      color: AppColors.kBlack.withOpacity(0.6),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(160)),
            child: Image.asset(Assets.imagesMainLogo),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(35)),
            child: const Text(
              'OVERVIEW',
              style: TextStyle(fontSize: 14, color: AppColors.kWhite),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(35)),
            child: const Text(
              'INVESTMENT',
              style: TextStyle(fontSize: 14, color: AppColors.kWhite),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(35)),
            child: const Text(
              'PORTFOLIO',
              style: TextStyle(fontSize: 14, color: AppColors.kWhite),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(35)),
            child: const Text(
              'NEWS',
              style: TextStyle(fontSize: 14, color: AppColors.kWhite),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(35)),
            child: const Text(
              'CONTACT',
              style: TextStyle(fontSize: 14, color: AppColors.kWhite),
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(150),)
        ],
      ),
    );
  }
}
