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
                            'Principle-based management',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: AppColors.kGreenTextColor,
                                    height: 2.0),
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              'SongHyun was built on over 50 years of\ntransparent management philosophy of\nHanglas Group and over 40 years of\ninvestment experience.',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.kBlack,height: 1.5))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Image(image: AssetImage(Assets.imagesVision2)),
                          Text(
                            textAlign: TextAlign.center,
                            'Mutual Growth',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: AppColors.kGreenTextColor,
                                    height: 2.0),
                          ),
                          Text(
                              textAlign: TextAlign.center,
                              'Management team of SongHyun has helped\nover 40portfolio companies to have a successful IPO\nand achieved strong growth with its managed funds;\nThrough this, the management of Songhyun\nhas been able to return profits to all concerned parties.',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: AppColors.kBlack,height: 1.5))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Image(image: AssetImage(Assets.imagesVision3)),
                          SizedBox(
                            height: getProportionateScreenHeight(190),
                            width: getProportionateScreenWidth(380),
                            child: Column(
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  'Long-term perspective Horizon',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          color: AppColors.kGreenTextColor,
                                          height: 2.0),
                                ),
                                Text(
                                    textAlign: TextAlign.center,
                                    'SongHyun aims to become a world-class investment firm\nwhich is committed to a long term investment horizon\nwhile strengthening its current growth foundation',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(color: AppColors.kBlack,height: 1.5))
                              ],
                            ),
                          )
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
