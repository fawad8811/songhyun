import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/responsive/web_body.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class FooterContiner extends StatelessWidget {
  const FooterContiner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(150)),
      width: double.infinity,
      height: getProportionateScreenHeight(100),
      color: Colors.transparent.withOpacity(0.5),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'COPYRIGHT (C) 2024 Choege Investment ALL RIGHTS RESERVED'
                  .toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.kWhite
              ),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Image.asset(Assets.imagesOnlyLogo, width: 30, height: 30),
              const SizedBox(width: 10),
              const Text(
                'Choege Investment\n Private Limited',
                style: TextStyle(
                  color: AppColors.kWhite,
                  fontSize: 10,
                  fontFamily: 'NotoSerifKR',
                ),
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
