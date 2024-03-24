import 'package:flutter/material.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/theme/app_colors.dart';
import 'package:songhyun/theme/app_theme.dart';

class HomeTextWidget extends StatelessWidget {
  final bool isMobile;

  const HomeTextWidget({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://cdn.pixabay.com/photo/2017/09/07/08/54/money-2724241_1280.jpg',
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(10),
          ),
          child: Center(
            child: Container(
              // height: 10,
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              color: Colors.transparent.withOpacity(0.5),
              child: SelectableText.rich(
                TextSpan(
                  style: MyAppTheme.textThemeLight.labelLarge!.copyWith(
                      color: AppColors.kWhite,
                      fontWeight: FontWeight.w400,
                      fontSize: isMobile ? 20 : 32),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Choege Investment Private Limited, ",
                      style: MyAppTheme.textThemeLight.labelLarge!
                          .copyWith(color: AppColors.kGreen, fontSize: 30),
                    ),
                    const TextSpan(
                      text:
                          'pursues long-term mutual growth with its portfolio companies through proven investment management principles.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
