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
                // Add more TimelineItem widgets as needed
                SizedBox(height: getProportionateScreenHeight(80)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
