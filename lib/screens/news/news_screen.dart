import 'package:flutter/material.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/screens/widgets/page_head.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const PageHead(title: 'Portfolio', image: Assets.imagesBgTopPortfolio),
        SizedBox(height: getProportionateScreenHeight(20)),
        Row(
          children: [
            Container(
              width: getProportionateScreenWidth(280),
              height: getProportionateScreenHeight(280),
              color: Colors.yellow,
            ),
            const Column(
              children: [Text('data'), Text('data'), Text('data')],
            )
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(40)),
      ],
    );
    // Padding(
    //   padding: EdgeInsets.only(
    //       left: getProportionateScreenWidth(30),
    //       right: getProportionateScreenWidth(30)
    //   ),
    //   child: Container(
    //     color: AppColors.kMainBackgroundColor,
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(
    //         horizontal: getProportionateScreenWidth(10),
    //         vertical: getProportionateScreenHeight(60),
    //       ),
    //       child: Column(
    //         children: [
    //
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
  }
}
