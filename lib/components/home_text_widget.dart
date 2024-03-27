import 'package:flutter/material.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:songhyun/utils/app_exports.dart';

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
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(180),
                ),
                SelectableText.rich(
                  TextSpan(
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppColors.kWhite,
                        fontWeight: FontWeight.w100,
                        fontSize: isMobile ? 16 : 28),
                    children: <TextSpan>[
                      TextSpan(
                        text: AppLocalizations.of(context)!.companyNameOne,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: AppColors.kGreen,
                              fontSize: isMobile ? 16 : 28,
                              fontWeight: FontWeight.w100,
                            ),
                      ),
                      TextSpan(
                          text: AppLocalizations.of(context)!.pursuitStatement),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
