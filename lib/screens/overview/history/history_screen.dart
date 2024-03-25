import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                  dates: const ['2012. 05.', '06.'],
                  descriptions: [
                    AppLocalizations.of(context)!.establishSongHyun,
                    AppLocalizations.of(context)!.establishSongHyun,
                    AppLocalizations.of(context)!.registerVentureCapital,
                  ],
                ),
                TimelineItem(
                  dates: const ['2013. 08.'],
                  descriptions: [
                    AppLocalizations.of(context)!.raiseFirstFund,
                  ],
                ),
                TimelineItem(
                  dates: const ['2014. 09.', '11.', '12.', '13.'],
                  descriptions: [
                    AppLocalizations.of(context)!.raiseGrowthLadderSecondFund,
                    AppLocalizations.of(context)!.raiseGrowthLadderSecondFund,
                    AppLocalizations.of(context)!.raiseKeystoneSongHyunFund,
                    AppLocalizations.of(context)!.acquireInstitutionalRating,
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
