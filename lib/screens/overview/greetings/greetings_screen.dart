import 'package:flutter/material.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GreetingsScreen extends StatelessWidget {
  const GreetingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            const PageHead(title: 'Greetings', image: Assets.imagesBgTopGreeting),
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenHeight(50),
                bottom: getProportionateScreenHeight(20),
              ),
              child: Text(
                AppLocalizations.of(context)!.greetingThankYou,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.kGreenTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50),
              ),
              child: Text(
                AppLocalizations.of(context)!.welcomeText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  height: 2.0,
                  color: AppColors.kBlack,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(150)),
          ],
        ),
      ],
    );
  }
}
