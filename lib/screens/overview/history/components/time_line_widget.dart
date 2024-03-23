import 'package:flutter_dash/flutter_dash.dart';
import 'package:songhyun/utils/app_exports.dart';

class TimelineItem extends StatelessWidget {
  final List<String> dates;
  final List<String> descriptions;

  const TimelineItem({
    Key? key,
    required this.dates,
    required this.descriptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
        top: getProportionateScreenHeight(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(dates.length, (index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(11),
                        vertical: getProportionateScreenHeight(11)),
                    child: Text(
                      textAlign: TextAlign.right,
                      dates[index],
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: AppColors.kGreenTextColor),
                    ),
                  ),
                ],
              );
            }),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(dates.length * 2 - 1, (index) {
              if (index.isEven) {
                return Container(
                  height: getProportionateScreenHeight(10),
                  width: getProportionateScreenWidth(10),
                  decoration: BoxDecoration(
                    color: AppColors.kGreenTextColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.5,
                      color: AppColors.kGreenTextColor,
                    ),
                  ),
                );
              } else {
                return const Dash(
                  direction: Axis.vertical,
                  length: 30,
                  dashThickness: 1,
                  dashLength: 30,
                  dashColor: AppColors.kGreenTextColor,
                );
              }
            }),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(descriptions.length, (index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(11),
                          vertical: getProportionateScreenHeight(11)),
                      child: Text(
                        textAlign: TextAlign.right,
                        descriptions[index],
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
