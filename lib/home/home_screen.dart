import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/home/components/home_app_bar_widget.dart';
import 'package:songhyun/home/components/home_bottom_widget.dart';
import 'package:songhyun/home/components/home_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesHomeBackgroundPng),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const HomeAppBarWidget(),
          const HomeTextWidget(),
          const HomeBottomWidget()
        ],
      ),
    );
  }
}
