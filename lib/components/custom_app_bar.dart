import 'package:flutter/material.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/components/menu_map.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/theme/app_colors.dart';
import 'package:songhyun/theme/app_theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isMobile;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ValueChanged<int>? onPageSelected;
  final Function(String)? onSubmenuSelected;

  const CustomAppBar({
    Key? key,
    required this.scaffoldKey,
    this.onPageSelected,
    this.onSubmenuSelected,
    this.isMobile = false,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading: const SizedBox.shrink(),
      toolbarHeight: getProportionateScreenHeight(100),
      backgroundColor: Colors.transparent.withOpacity(0.75),
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(60),
          ),
          child: Row(
            children: [
              Image.asset(Assets.imagesOnlyLogo, width: 50, height: 50),
              const SizedBox(width: 20),
              Text(
                'Choege Investment\n Private Limited',
                style: MyAppTheme.textThemeLight.labelLarge!.copyWith(
                  color: AppColors.kWhite,
                ),
              ),
            ],
          ),
        ),
        if (widget.isMobile) ...{
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: AppColors.kWhite,
            ),
            onPressed: () {
              // Open the end drawer when the menu icon is pressed
              widget.scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        } else ...{
          const Spacer(),
          ...MenuMap.submenuItems.keys.take(2).map((title) {
            return _buildSubMenuButton(title, context);
          }).toList(),
          for (int i = 2; i < MenuMap.submenuItems.length; i++)
            _buildRegularButton(
                MenuMap.submenuItems.keys.elementAt(i), context),
        }
      ],
    );
  }

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
      color: isSubMenu ? Colors.transparent.withOpacity(0.6) : null,
      // shadowColor: Colors.transparent.withOpacity(0.2),
      itemBuilder: (context) {
        return MenuMap.submenuItems[title]!.map((item) {
          return PopupMenuItem<String>(
            height: 30,
            value: item,
            child: Text(
              item.toUpperCase(),
              style: MyAppTheme.textThemeLight.bodySmall!.copyWith(
                color: AppColors.kWhite,
              ),
            ),
          );
        }).toList();
      },
      onSelected: (String result) {
        widget.onSubmenuSelected?.call(result);
        // Navigator.pop(context); // Close the first menu
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
