import 'package:easy_localization/easy_localization.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class GreetingsScreen extends StatelessWidget {

  const GreetingsScreen({Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            const PageHead(title:'Greetings', image: Assets.imagesBgTopGreeting),
            Padding(
              padding: EdgeInsets.only(
                  top: getProportionateScreenHeight(50),
                  bottom: getProportionateScreenHeight(20)),
              child: Text(
                textAlign: TextAlign.center,
                'Thank you for visiting SongHyun Investment.'.tr(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.kGreenTextColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50)),
              child: Text(
                textAlign: TextAlign.center,
                'welcomeText'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(height: 2.0, color: AppColors.kBlack),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(150)),
          ],
        ),
      ],
    );
  }
}
