import 'package:flutter/material.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/screens/history/components/time_line_widget.dart';
import 'package:songhyun/theme/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HistoryScreen({Key? key, required this.scaffoldKey}) : super(key: key);

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
                        'History',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: AppColors.kWhite),
                      ),
                    )
                  ],
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TimelineItem(
                    dates: ['2012. 05.', '06.'],
                    descriptions: [
                      'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                      'Register as Venture Capital (SMBA)',
                    ],
                  ),
                  TimelineItem(
                    dates: ['2013. 08.'],
                    descriptions: [
                      'Raise ‘ SongHyun Growth Ladder the 1st Fund’ (KRW 30bn)'
                    ],
                  ),
                  TimelineItem(
                    dates: ['2014. 09.', '11.	', '12. ', '13. '],
                    descriptions: [
                      'Raise ‘SongHyun Young Entrepreneur the 1st Fund’ (KRW 24bn)',
                      'Raise ‘2014 SongHyun Growth Ladder 2nd Start-up Fund’ (KRW 16.5bn)',
                      'Raise ‘Keystone-SongHyun Value Creation PEF Fund’ (KRW 155bn)',
                      'Acquire institutional investor rating ‘A’ from SMBA',
                    ],
                  ),
                  TimelineItem(
                    dates: ['2012. 05.', '06.'],
                    descriptions: [
                      'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                      'Register as Venture Capital (SMBA)',
                    ],
                  ),
                  TimelineItem(
                    dates: ['2012. 05.', '06.'],
                    descriptions: [
                      'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                      'Register as Venture Capital (SMBA)',
                    ],
                  ),
                  TimelineItem(
                    dates: ['2012. 05.', '06.'],
                    descriptions: [
                      'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                      'Register as Venture Capital (SMBA)',
                    ],
                  ),
                  TimelineItem(
                    dates: ['2012. 05.', '06.'],
                    descriptions: [
                      'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                      'Register as Venture Capital (SMBA)',
                    ],
                  ),
                  TimelineItem(
                    dates: ['2012. 05.', '06.'],
                    descriptions: [
                      'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                      'Register as Venture Capital (SMBA)',
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
