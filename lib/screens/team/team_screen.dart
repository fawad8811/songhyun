import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class TeamScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const TeamScreen({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            const PageHead(title: 'Team', image: Assets.imagesBgTopTeam),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(50)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: getProportionateScreenHeight(275),
                    width: getProportionateScreenWidth(80),
                    decoration: const BoxDecoration(
                      color: AppColors.kGreen,
                    ),
                  ),
                  Container(
                    height: getProportionateScreenHeight(275),
                    width: getProportionateScreenWidth(80),
                    decoration: const BoxDecoration(
                      color: AppColors.kGreen,
                    ),
                  ),
                  Container(
                    height: getProportionateScreenHeight(275),
                    width: getProportionateScreenWidth(80),
                    decoration: const BoxDecoration(
                      color: AppColors.kGreen,
                    ),
                    child: Image.asset(Assets.imagesTeam1, fit: BoxFit.cover),
                  ),
                  Container(
                    height: getProportionateScreenHeight(275),
                    width: getProportionateScreenWidth(80),
                    decoration: const BoxDecoration(
                      color: AppColors.kGreen,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
