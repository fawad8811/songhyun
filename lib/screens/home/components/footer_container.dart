import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/screens/home/responsive/web_body.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class FooterContainer extends StatelessWidget {
  final bool isMainScreen;

  const FooterContainer({
    super.key,
    required this.isMainScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(150)),
      width: double.infinity,
      height: getProportionateScreenHeight(80),
      color:
          isMainScreen ? Colors.transparent.withOpacity(0.5) : AppColors.kWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'COPYRIGHT (C) 2024 Choege Investment ALL RIGHTS RESERVED'
                  .toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: isMainScreen? AppColors.kWhite : AppColors.kBlack),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Image.asset(Assets.imagesOnlyLogo, width: 30, height: 30),
              const SizedBox(width: 10),
              Text(
                'Choege Investment\n Private Limited',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: isMainScreen ? AppColors.kWhite : AppColors.kBlack
                )
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          const LanguageButton(),
        ],
      ),
    );
  }
}
