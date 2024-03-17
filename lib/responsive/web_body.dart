import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/home/components/footer_continer.dart';
import 'package:songhyun/home/components/home_text_widget.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class WebBody extends StatelessWidget {
  const WebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            Assets.imagesHomeBackgroundPng, // Replace with your image path
            fit: BoxFit.cover,
          ),
          // Column for the content
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // AppBar
              AppBar(
                backgroundColor: Colors.transparent.withOpacity(0.5),
                elevation: 0,
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(32),
                    ),
                    child: Image.asset(Assets.imagesMainLogo),
                  ),
                  const Spacer(),
                  _buildAppBarButton('OVERVIEW'),
                  _buildAppBarButton('INVESTMENT'),
                  _buildAppBarButton('PORTFOLIO'),
                  _buildAppBarButton('NEWS'),
                  _buildAppBarButton('CONTACT'),
                ],
              ),
              // Body Content
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeTextWidget(),
                      FooterContiner(
                        isWebBody: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, color: AppColors.kWhite),
      ),
    );
  }
}
