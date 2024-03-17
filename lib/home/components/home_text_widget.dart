import 'package:flutter/material.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class HomeTextWidget extends StatelessWidget {
  const HomeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(150),
        vertical: getProportionateScreenHeight(150),
      ),
      child: RichText(
        text: const TextSpan(
          style: TextStyle(color: AppColors.kWhite, fontSize: 33),
          children: <TextSpan>[
            TextSpan(
              text: 'Evergreen Pine Hill, Songhyeon ',
            ),
            TextSpan(
              text: '松峴',
              style: TextStyle(
                  color: Colors
                      .green), // Change the color of the Chinese words here
            ),
            TextSpan(
              text:
                  ' always\npursues shared growth with invested companies with consistent investment\nprinciples.',
              // style: TextStyle(color: ), // Change the color of the Chinese words here
            ),
          ],
        ),
      ),
    );
  }
}
