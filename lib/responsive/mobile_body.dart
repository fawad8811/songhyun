import 'dart:async';

import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/home/components/footer_continer.dart';
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

  // Define submenu items for each top-level button
  static final Map<String, List<String>> submenuItems = {
    'OVERVIEW': ['Greeting', 'Vision', 'History', 'Team'],
    'INVESTMENT': ['Philosophy', 'Stategy', 'Fund'],
    'PORTFOLIO': [],
    'NEWS': [],
    'CONTACT': [],
  };

  String? _selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
            // Background Image
            const RandomImageRotator(),
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
                // Body Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HomeTextWidget(),
                        SizedBox(height: getProportionateScreenHeight(200)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Positioned copyright container
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30),
                ),
                height: getProportionateScreenHeight(100),
                color: Colors.transparent.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'COPYRIGHT (C) 2015 SONGHYUN INVESTMENT \n ALL RIGHTS RESERVED',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.kWhite,
                        ),
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(Assets.imagesBtnKorean),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  List<Widget> _buildMenuItems() {
    List<Widget> items = [];
    submenuItems.forEach((key, value) {
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
                // Handle subitem tap here
                print('Tapped on subitem: $title');
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
              // Handle top-level item tap here
              print('Tapped on top-level item: $title');
            },
          );
  }
}

class RandomImageRotator extends StatefulWidget {
  const RandomImageRotator({super.key});

  @override
  _RandomImageRotatorState createState() => _RandomImageRotatorState();
}

class _RandomImageRotatorState extends State<RandomImageRotator> {
  String _imageUrl = 'https://source.unsplash.com/random'; // Default URL
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      setState(() {
        _imageUrl =
            'https://source.unsplash.com/random'; // Update the URL to fetch a new random image
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      _imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
