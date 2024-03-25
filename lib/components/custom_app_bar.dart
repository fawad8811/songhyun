import 'dart:developer';
import 'package:songhyun/utils/app_exports.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isMobile;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ValueChanged<int>? onPageSelected;
  final Function(String)? onSubmenuSelected;
  final VoidCallback? onLogoTap;

  const CustomAppBar({
    Key? key,
    required this.scaffoldKey,
    this.onPageSelected,
    this.onSubmenuSelected,
    this.isMobile = false,
    this.onLogoTap,
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
      toolbarHeight: getProportionateScreenHeight(140),
      backgroundColor: Colors.transparent.withOpacity(0.75),
      elevation: 0,
      actions: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              widget.onLogoTap?.call();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
                vertical: getProportionateScreenHeight(20),
              ),
              child:
                  // SvgPicture.asset(
                  //   Assets.imagesChoegeLogo,
                  //   color: Colors.blue[400],
                  // ),

                  Image.asset(
                Assets.imagesChoegeLogoRemovebg,
                height: 200,
                width: 200,
              ),
            ),
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

  Widget _buildAppBarButton(
      String title, BuildContext context, bool isSubMenu) {
    // Check if the submenu items list is empty
    if (MenuMap.submenuItems[title]!.isEmpty) {
      return InkWell(
        onTap: () {
          log('Selected: $title');
          // Perform navigation based on the selected title
          switch (title) {
            case 'PORTFOLIO':
              widget.onSubmenuSelected?.call('PORTFOLIO');
              // Implement navigation to the Portfolio screen
              break;
            case 'NEWS':
              widget.onSubmenuSelected?.call('NEWS');
              // Implement navigation to the News screen
              break;
            case 'CONTACT':
              widget.onSubmenuSelected?.call('CONTACT');
              // Implement navigation to the Contact screen
              break;
            default:
              // Handle other cases or do nothing
              break;
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(fontSize: 14, color: AppColors.kWhite),
          ),
        ),
      );
    }

    // If submenu items exist, return a PopupMenuButton
    return PopupMenuButton<String>(
      tooltip: '',
      onSelected: (String result) {
        log('Selected: $result');
        widget.onSubmenuSelected?.call(result);
      },
      color: isSubMenu ? Colors.transparent.withOpacity(0.6) : null,
      itemBuilder: (context) {
        return MenuMap.submenuItems[title]!.map((item) {
          return PopupMenuItem<String>(
            height: 30,
            value: item,
            child: Text(
              item.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kWhite,
                  ),
            ),
          );
        }).toList();
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
