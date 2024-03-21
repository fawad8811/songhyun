import 'package:flutter/material.dart';
import 'package:songhyun/components/custom_app_bar.dart';
import 'package:songhyun/components/footer_container.dart';
import 'package:songhyun/components/home_text_widget.dart';
import 'package:songhyun/screens/greetings/greetings_screen.dart';
import 'package:songhyun/screens/vision/vision_screen.dart';
import 'package:songhyun/theme/app_colors.dart';

class WebBody extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const WebBody({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  WebBodyState createState() => WebBodyState();
}

class WebBodyState extends State<WebBody> {
  late PageController _pageController; // Add a PageController
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Initialize the PageController
    _pages = [
      const HomeTextWidget(),
      GreetingsScreen(
        scaffoldKey: widget.scaffoldKey,
      ),
      VisionScreen(
        scaffoldKey: widget.scaffoldKey,
      ),
    ];
  }

  void _handleSubmenuSelected(String value) {
    if (value == 'Greeting') {
      _pageController.animateToPage(
        1, // Assuming GreetingsScreen is at index 1
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (value == 'Vision') {
      // Use the PageController to navigate to the Vision screen
      _pageController.animateToPage(
        2, // Assuming VisionScreen is at index 2
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(
                scaffoldKey: widget.scaffoldKey,
                onPageSelected: (index) {
                  // Change the page when a menu item is selected
                  setState(() {
                    // Ensure index is within bounds of _pages list
                    if (index >= 0 && index < _pages.length) {
                      _pages[index] = _getPageByIndex(index);
                    }
                  });
                },
                onSubmenuSelected: _handleSubmenuSelected,
              ),
              const FooterContainer(
                isMainScreen: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return const HomeTextWidget();
      case 1:
        return GreetingsScreen(
          scaffoldKey: widget.scaffoldKey,
        );
      case 2:
        return VisionScreen(
          scaffoldKey: widget.scaffoldKey,
        );
      // Add other cases for additional screens
      default:
        return Container();
    }
  }
}

// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final bool isMobile;
//   final GlobalKey<ScaffoldState> scaffoldKey;
//   final ValueChanged<int>? onPageSelected;
//   final Function(String)? onSubmenuSelected;

//   const CustomAppBar({
//     Key? key,
//     required this.scaffoldKey,
//     this.onPageSelected,
//     this.onSubmenuSelected,
//     this.isMobile = false,
//   }) : super(key: key);

//   @override
//   State<CustomAppBar> createState() => _CustomAppBarState();

//   @override
//   Size get preferredSize => const Size.fromHeight(120);
// }

// class _CustomAppBarState extends State<CustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       centerTitle: false,
//       leading: const SizedBox.shrink(),
//       toolbarHeight: getProportionateScreenHeight(100),
//       backgroundColor: Colors.transparent.withOpacity(0.75),
//       elevation: 0,
//       actions: [
//         Padding(
//           padding: EdgeInsets.only(
//             left: getProportionateScreenWidth(60),
//           ),
//           child: Row(
//             children: [
//               Image.asset(Assets.imagesOnlyLogo, width: 50, height: 50),
//               const SizedBox(width: 20),
//               Text(
//                 'Choege Investment\n Private Limited',
//                 style: MyAppTheme.textThemeLight.labelLarge!.copyWith(
//                   color: AppColors.kWhite,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         if (widget.isMobile) ...{
//           const Spacer(),
//           IconButton(
//             icon: const Icon(
//               Icons.menu,
//               color: AppColors.kWhite,
//             ),
//             onPressed: () {
//               // Open the end drawer when the menu icon is pressed
//               widget.scaffoldKey.currentState!.openEndDrawer();
//             },
//           ),
//         } else ...{
//           const Spacer(),
//           ...MenuMap.submenuItems.keys.take(2).map((title) {
//             return _buildSubMenuButton(title, context);
//           }).toList(),
//           for (int i = 2; i < MenuMap.submenuItems.length; i++)
//             _buildRegularButton(
//                 MenuMap.submenuItems.keys.elementAt(i), context),
//         }
//       ],
//     );
//   }

//   Widget _buildSubMenuButton(String title, BuildContext context) {
//     return _buildAppBarButton(title, context, true);
//   }

//   Widget _buildRegularButton(String title, BuildContext context) {
//     return _buildAppBarButton(title, context, false);
//   }

//   PopupMenuButton<String> _buildAppBarButton(
//       String title, BuildContext context, bool isSubMenu) {
//     return PopupMenuButton<String>(
//       tooltip: '',
//       color: isSubMenu ? Colors.transparent.withOpacity(0.2) : null,
//       itemBuilder: (context) {
//         return MenuMap.submenuItems[title]!.map((item) {
//           return PopupMenuItem<String>(
//             height: 30,
//             value: item,
//             child: Text(
//               item.toUpperCase(),
//               style: MyAppTheme.textThemeLight.bodySmall!.copyWith(
//                 color: AppColors.kWhite,
//               ),
//             ),
//           );
//         }).toList();
//       },
//       onSelected: (String result) {
//         widget.onSubmenuSelected?.call(result);
//         // Navigator.pop(context); // Close the first menu
//       },
//       offset: const Offset(0, 50),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Text(
//           title,
//           style: const TextStyle(fontSize: 14, color: AppColors.kWhite),
//         ),
//       ),
//     );
//   }
// }

// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final GlobalKey<ScaffoldState> scaffoldKey;
//   final ValueChanged<int>? onPageSelected;
//   final Function(String)? onSubmenuSelected;

//   const CustomAppBar({
//     Key? key,
//     required this.scaffoldKey,
//     this.onPageSelected,
//     this.onSubmenuSelected,
//   }) : super(key: key);

//   @override
//   CustomAppBarState createState() => CustomAppBarState();

//   @override
//   Size get preferredSize => const Size.fromHeight(120);
// }

// class CustomAppBarState extends State<CustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       centerTitle: false,
//       leading: const SizedBox.shrink(),
//       toolbarHeight: getProportionateScreenHeight(100),
//       backgroundColor: Colors.transparent.withOpacity(0.75),
//       elevation: 0,
//       actions: [
//         Padding(
//           padding: EdgeInsets.only(
//             left: getProportionateScreenWidth(60),
//           ),
//           child: Row(
//             children: [
//               Image.asset(Assets.imagesOnlyLogo, width: 50, height: 50),
//               const SizedBox(width: 20),
//               Text(
//                 'Choege Investment\n Private Limited',
//                 style: MyAppTheme.textThemeLight.labelLarge!.copyWith(
//                   color: AppColors.kWhite,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         PopupMenuButton(
//           child: const Text('MENU'),
//           itemBuilder: (BuildContext context) =>
//               MenuMap.submenuItems.keys.map((title) {
//             return PopupMenuItem(
//               child: PopupMenuButton(
//                 child: Text(title),
//                 onSelected: (String result) {
//                   widget.onSubmenuSelected?.call(result);
//                   Navigator.pop(context); // Close the first menu
//                 },
//                 itemBuilder: (BuildContext context) =>
//                     MenuMap.submenuItems[title]!.map((String submenuItem) {
//                   return PopupMenuItem<String>(
//                     value: submenuItem,
//                     child: Text(submenuItem),
//                   );
//                 }).toList(),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
