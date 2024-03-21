import 'package:flutter/material.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/theme/app_colors.dart';

class VisionScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const VisionScreen({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: getProportionateScreenHeight(120),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              Container(
                width: double.infinity,
                height: getProportionateScreenHeight(450),
                decoration: const BoxDecoration(
                  color: AppColors.kMainBackgroundColor,
                  image: DecorationImage(
                      image: AssetImage(Assets.imagesBgTopVision),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: getProportionateScreenHeight(10),
                      left: getProportionateScreenWidth(50),
                      child: Text(
                        'Vision',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(color: AppColors.kWhite),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(40),
                  right: getProportionateScreenWidth(40),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Image(image: AssetImage(Assets.imagesVision1)),
                          Text(
                            textAlign: TextAlign.center,
                            'Based on the philosophy of Jeong-Do\nmanagement,',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: AppColors.kGreenTextColor),
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              'Songhyun was established through a combination of transparent management philosophy and investment\nexperience\nbased on Jeong-Do management principles .',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.kBlack))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Image(image: AssetImage(Assets.imagesVision2)),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppColors.kGreenTextColor),
                              children: [
                                TextSpan(
                                    text: 'Pursuing shared growth,',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: AppColors.kGreenTextColor)),
                                TextSpan(
                                  text:
                                      'we have achieved shared\ngrowth by distributing the fruits to all executives and\nemployees, investors, and investment companies through\nthe\n40% IPO success rate of investment companies and the\nexcellent performance of the management association .',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: AppColors.kBlackTextColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Image(image: AssetImage(Assets.imagesVision3)),
                          Text(
                            textAlign: TextAlign.center,
                            'Aiming for the Long-Run',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: AppColors.kGreenTextColor),
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              'Songhyun aims to be an investment institution that\nlooks to the future and lays the foundation for long-term\ngrowth rather than pursuing short-term profits.',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.kBlack))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
