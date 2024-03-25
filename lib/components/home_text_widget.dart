import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/theme/app_colors.dart';

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
            child: SelectableText.rich(
              TextSpan(
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kWhite,
                    fontWeight: FontWeight.w100,
                    fontSize: isMobile ? 10 : 25),
                children: <TextSpan>[
                  TextSpan(
                    text: "companyNameOne".tr(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.green, fontSize: isMobile ? 10 : 30),
                  ),
                  TextSpan(text: "pursuitStatement".tr()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
