import 'package:flutter/material.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class FundScreen extends StatelessWidget {
  final bool isMobile;

  const FundScreen({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const PageHead(
          title: 'Fund',
          image: Assets.imagesBgTopFund,
        ),
        SizedBox(height: getProportionateScreenHeight(100)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Image.asset(Assets.imagesFund1En),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(5),
                  vertical: getProportionateScreenHeight(40),
                ),
                child: Text(
                  'Our company holds every fund needed for various stages of development, starting from early stages (Crowd Fund, Start up Fund, Young Entrepreneur Fund) to growth stage (Growth Ladder Fund) and finally to PEF, and is willing to do everything as a partner to ensure scalable growth. In addition, we have raised Secondary Fund to activate the circulation of venture investment for fostering venture ecology. And raised e-New Industry Fund to invest in the 4th industrial revolution industry such as Energy, IoT, AI and Convergence of IT & Energy industry.',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      height: 2.0, color: AppColors.kBlack, fontSize: 20),
                ),
              ),
              Image.asset(Assets.imagesFund2En),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(150)),
      ],
    );
  }
}
