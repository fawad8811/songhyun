import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/home/components/home_app_bar_widget.dart';
import 'package:songhyun/home/components/home_bottom_widget.dart';
import 'package:songhyun/home/components/home_text_widget.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBlack.withOpacity(0.6),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(32),
            ),
            child: Image.asset(Assets.imagesMainLogo),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: AppColors.kWhite,
            ),
            onPressed: () {
              // Open the end drawer when the menu icon is pressed
              scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(Assets.imagesHomeBackgroundPng),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // HomeAppBarWidget(),
            HomeTextWidget(),
            HomeBottomWidget()
          ],
        ),
      ),
    );
  }
}
