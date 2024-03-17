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
        horizontal: getProportionateScreenWidth(60),
        vertical: getProportionateScreenHeight(20),
      ),
      child: const SelectableText.rich(
        TextSpan(
          style: TextStyle(color: AppColors.kWhite, fontSize: 33),
          children: <TextSpan>[
            TextSpan(
              text: "SONGHYUN('松峴', Evergreen pine hills), ",
              style: TextStyle(
                  color: Colors
                      .green), // Change the color of the Chinese words here
            ),
            // ),
            // TextSpan(
            //   text: '松峴',
            //   style: TextStyle(
            //       color: Colors
            //           .green), // Change the color of the Chinese words here
            // ),
            TextSpan(
              text:
                  'pursues long-term mutual growth with its portfolio companies through proven investment management principles.',
              // style: TextStyle(color: ), // Change the color of the Chinese words here
            ),
          ],
        ),
      ),
    );
  }
}
