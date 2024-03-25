import 'package:flutter/material.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/theme/app_colors.dart';
import 'package:songhyun/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTextWidget extends StatelessWidget {
  final bool isMobile;

  const HomeTextWidget({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(Assets.imagesHomeBg, fit: BoxFit.cover),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            // vertical: getProportionateScreenHeight(10),
          ),
          child: Center(
            child: Container(
              // height: 10,
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              color: Colors.transparent.withOpacity(0.5),
              child: SelectableText.rich(
                TextSpan(
                  style: MyAppTheme.textThemeLight.labelLarge!.copyWith(
                      color: AppColors.kWhite,
                      fontWeight: FontWeight.w400,
                      fontSize: isMobile ? 20 : 32),
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLocalizations.of(context)!.companyNameOne,
                      style: MyAppTheme.textThemeLight.labelLarge!
                          .copyWith(color: AppColors.kGreen, fontSize: 30),
                    ),
                    TextSpan(text: AppLocalizations.of(context)!.pursuitStatement),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
