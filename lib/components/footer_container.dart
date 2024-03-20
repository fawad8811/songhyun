import 'package:flutter/material.dart';
import 'package:songhyun/components/language_button.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class FooterContainer extends StatelessWidget {
  final bool isMainScreen;
  final bool isMobile;

  const FooterContainer({
    Key? key,
    this.isMainScreen = false,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? buildMobileFooter(context)
        : buildDesktopFooter(context, isMainScreen);
  }

  Widget buildMobileFooter(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(60),
        ),
        height: getProportionateScreenHeight(120),
        color: Colors.transparent.withOpacity(0.75),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildCopyrightText(context),
            ),
            const Spacer(),
            const LanguageButton(),
          ],
        ),
      ),
    );
  }

  Widget buildDesktopFooter(BuildContext context, bool isMainScreen) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(150)),
      width: double.infinity,
      height: getProportionateScreenHeight(80),
      color: isMainScreen
          ? Colors.transparent.withOpacity(0.75)
          : AppColors.kWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildCopyrightText(context, isMainScreen),
          ),
          const Spacer(),
          buildLogoAndCompanyName(context, isMainScreen),
          const SizedBox(
            width: 20,
          ),
          const LanguageButton(),
        ],
      ),
    );
  }

  Widget buildCopyrightText(BuildContext context, [bool isMainScreen = false]) {
    return Text(
      'COPYRIGHT (C) 2024 Choege Investment ALL RIGHTS RESERVED'.toUpperCase(),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color:
                isMainScreen || isMobile ? AppColors.kWhite : AppColors.kBlack,
          ),
      maxLines: 3,
      textAlign: TextAlign.center,
    );
  }

  Widget buildLogoAndCompanyName(BuildContext context, bool isMainScreen) {
    return Row(
      children: [
        Image.asset(Assets.imagesOnlyLogo, width: 30, height: 30),
        const SizedBox(width: 10),
        Text('Choege Investment\n Private Limited',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: isMainScreen ? AppColors.kWhite : AppColors.kBlack)),
      ],
    );
  }
}
