import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/screens/history/components/time_line_widget.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const PageHead(title: 'History', image: Assets.imagesBgTopHistory),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TimelineItem(
                dates: ['2012. 05.', '06.'],
                descriptions: [
                  'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                  'Register as Venture Capital (SMBA)',
                ],
              ),
              const TimelineItem(
                dates: ['2013. 08.'],
                descriptions: [
                  'Raise ‘ SongHyun Growth Ladder the 1st Fund’ (KRW 30bn)'
                ],
              ),
              const TimelineItem(
                dates: ['2014. 09.', '11.	', '12. ', '13. '],
                descriptions: [
                  'Raise ‘SongHyun Young Entrepreneur the 1st Fund’ (KRW 24bn)',
                  'Raise ‘2014 SongHyun Growth Ladder 2nd Start-up Fund’ (KRW 16.5bn)',
                  'Raise ‘Keystone-SongHyun Value Creation PEF Fund’ (KRW 155bn)',
                  'Acquire institutional investor rating ‘A’ from SMBA',
                ],
              ),
              const TimelineItem(
                dates: ['2012. 05.', '06.'],
                descriptions: [
                  'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                  'Register as Venture Capital (SMBA)',
                ],
              ),
              const TimelineItem(
                dates: ['2012. 05.', '06.'],
                descriptions: [
                  'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                  'Register as Venture Capital (SMBA)',
                ],
              ),
              const TimelineItem(
                dates: ['2012. 05.', '06.'],
                descriptions: [
                  'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                  'Register as Venture Capital (SMBA)',
                ],
              ),
              const TimelineItem(
                dates: ['2012. 05.', '06.'],
                descriptions: [
                  'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                  'Register as Venture Capital (SMBA)',
                ],
              ),
              const TimelineItem(
                dates: ['2012. 05.', '06.'],
                descriptions: [
                  'Establish SongHyun Investment (Paid in Capital KRW 20bn)',
                  'Register as Venture Capital (SMBA)',
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(80),
              )
            ],
          ),
        ),
      ],
    );
  }
}
