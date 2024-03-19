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
        vertical: getProportionateScreenHeight(10),
      ),
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        color: Colors.transparent.withOpacity(0.5),
        child: SelectableText.rich(
          TextSpan(
            style: const TextStyle(color: AppColors.kWhite, fontSize: 33),
            children: <TextSpan>[
              const TextSpan(
                text: "Choege Investment Private Limited, ",
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
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.kWhite,
                  fontWeight: FontWeight.w100
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
