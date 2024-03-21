import 'package:flutter/material.dart';
import 'package:songhyun/components/custom_app_bar.dart';
import 'package:songhyun/components/footer_container.dart';
import 'package:songhyun/components/menu_map.dart';
import 'package:songhyun/components/home_text_widget.dart';
import 'package:songhyun/theme/app_colors.dart';

class MobileScaffold extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const MobileScaffold({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  String? _selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: widget.scaffoldKey,
        endDrawer: Drawer(
          backgroundColor: Colors.transparent.withOpacity(0.5),
          elevation: 0,
          child: ListView(
            children: _buildMenuItems(),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            const HomeTextWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAppBar(
                  isMobile: true,
                  scaffoldKey: widget.scaffoldKey,
                ),
                const FooterContainer(
                  isMobile: true,
                ),
              ],
            ),
          ],
        ));
  }

  List<Widget> _buildMenuItems() {
    List<Widget> items = [];
    MenuMap.submenuItems.forEach((key, value) {
      items.add(_buildMenuItem(key));
      if (_selectedMenu == key) {
        items.add(
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 3.5,
            physics: const NeverScrollableScrollPhysics(),
            children: value.map((subItem) {
              return _buildMenuItem(subItem, isSubItem: true);
            }).toList(),
          ),
        );
      }
    });
    return items;
  }

  Widget _buildMenuItem(String title, {bool isSubItem = false}) {
    return isSubItem
        ? Container(
            decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.2),
              border: Border.all(
                  color: const Color.fromARGB(255, 167, 167, 167)
                      .withOpacity(1)), // Adjust color and width as needed
            ),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.kWhite,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                
              },
            ),
          )
        : ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.kWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              if (_selectedMenu != title) {
                setState(() {
                  _selectedMenu = title;
                });
              }
            },
          );
  }
}
