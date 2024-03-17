import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/home/components/home_bottom_widget.dart';
import 'package:songhyun/home/components/home_text_widget.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        // width: 200,
        backgroundColor: AppColors.kBlack.withOpacity(0.6),
        elevation: 0,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                'OVERVIEW',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.kWhite,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'INVESTMENT',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.kWhite,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'PORTFOLIO',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.kWhite,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'NEWS',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.kWhite,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'CONTACT',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.kWhite,
                ),
              ),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [HomeTextWidget(), HomeBottomWidget()],
        ),
      ),
    );
  }
}
