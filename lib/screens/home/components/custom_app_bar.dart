import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/screens/home/responsive/web_body.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: getProportionateScreenHeight(120),
      backgroundColor: Colors.transparent.withOpacity(0.5),
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(60),
          ),
          child: Row(
            children: [
              Image.asset(Assets.imagesOnlyLogo, width: 70, height: 70),
              const SizedBox(width: 20),
              const Text(
                'Choege Investment\n Private Limited',
                style: TextStyle(
                  color: AppColors.kWhite,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        ...WebBody.submenuItems.keys.take(2).map((title) {
          return _buildSubMenuButton(title, context);
        }).toList(),
        for (int i = 2; i < WebBody.submenuItems.length; i++)
          _buildRegularButton(WebBody.submenuItems.keys.elementAt(i), context),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);

  Widget _buildSubMenuButton(String title, BuildContext context) {
    return _buildAppBarButton(title, context, true);
  }

  Widget _buildRegularButton(String title, BuildContext context) {
    return _buildAppBarButton(title, context, false);
  }

  PopupMenuButton<String> _buildAppBarButton(
      String title, BuildContext context, bool isSubMenu) {
    return PopupMenuButton<String>(
      tooltip: '',
      color: isSubMenu ? Colors.transparent.withOpacity(0.2) : null,
      itemBuilder: (context) {
        return WebBody.submenuItems[title]!.map((item) {
          return PopupMenuItem<String>(
            height: 30,
            value: item,
            child: Text(
              item.toUpperCase(),
              style: const TextStyle(
                color: AppColors.kWhite,
                fontSize: 14,
              ),
            ),
          );
        }).toList();
      },
      onSelected: (value) {
        if (value == 'Greeting') {
          Navigator.pushNamed(context, '/greetings');
        }
      },
      offset: const Offset(0, 50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, color: AppColors.kWhite),
        ),
      ),
    );
  }
}
