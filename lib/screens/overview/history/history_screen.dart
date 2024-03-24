import 'package:songhyun/screens/overview/history/components/time_line_widget.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHead(title: 'History', image: Assets.imagesBgTopHistory),
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(24),
              vertical: getProportionateScreenHeight(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TimelineItem(
                  dates: ['2012. 05.', '06.'],
                  descriptions: [
                    'establishSongHyun',
                    'registerVentureCapital',
                  ],
                ),
                const TimelineItem(
                  dates: ['2013. 08.'],
                  descriptions: [
                    'raiseFirstFund',
                  ],
                ),
                const TimelineItem(
                  dates: ['2014. 09.', '11.', '12.', '13.'],
                  descriptions: [
                    'raiseYoungEntrepreneurFund',
                    'raiseGrowthLadderSecondFund',
                    'raiseKeystoneSongHyunFund',
                    'acquireInstitutionalRating',
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(80)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
