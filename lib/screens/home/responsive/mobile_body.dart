import 'dart:developer';
import 'package:songhyun/screens/contact/contact_screen.dart';
import 'package:songhyun/screens/investment/fund/fund_screen.dart';
import 'package:songhyun/screens/investment/philosophy/philosophy_screen.dart';
import 'package:songhyun/screens/investment/strategy/strategy_screen.dart';
import 'package:songhyun/screens/news/news_screen.dart';
import 'package:songhyun/screens/overview/greetings/greetings_screen.dart';
import 'package:songhyun/screens/overview/history/history_screen.dart';
import 'package:songhyun/screens/overview/team/team_screen.dart';
import 'package:songhyun/screens/overview/vision/vision_screen.dart';
import 'package:songhyun/screens/portfolio/portfolio_screen.dart';
import 'package:songhyun/utils/app_exports.dart';

class MobileScaffold extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MobileScaffold({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  String? _selectedMenu; // Define _selectedMenu here

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: const [
              HomeTextWidget(),
              GreetingsScreen(),
              VisionScreen(
                isMobile: true,
              ),
              HistoryScreen(),
              TeamScreen(
                isMobile: true,
              ),
              PhilosophyScreen(
                isMobile: true,
              ),
              StrategyScreen(isMobile: true),
              FundScreen(),
              PortfolioScreen(
                isMobile: true,
              ),
              NewsScreen(
                isMobile: true,
              ),
              ContactScreen(),
              // Add other screens here
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(
                isMobile: true,
                scaffoldKey: widget.scaffoldKey,
                onLogoTap: () {
                  WebBody.navigateToPage(_pageController, 0);
                },
              ),
              FooterContainer(
                isMobile: true,
                pageIndex: _currentPageIndex,
              ),
            ],
          ),
        ],
      ),
    );
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
                color: const Color.fromARGB(255, 167, 167, 167).withOpacity(1),
              ), // Adjust color and width as needed
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
                log('Subitem tapped: $title');
                // Handle subitem tap, you can replace this with navigation logic
                MyNavigation.handleSubmenuSelected(
                  title,
                  _pageController,
                );
                setState(() {
                  _selectedMenu = title;
                });
                Navigator.pop(context);
              },
            ),
          )
        : ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: _selectedMenu == title
                    ? AppColors.kWhite // Highlight selected menu item
                    : Colors.white, // Default color
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              if (_selectedMenu != title) {
                setState(() {
                  _selectedMenu = title;
                });
                MyNavigation.handleSubmenuSelected(
                  title,
                  _pageController,
                );
                if (title == 'PORTFOLIO' ||
                    title == 'NEWS' ||
                    title == 'CONTACT') {
                  Navigator.pop(context);
                }
              }
            },
          );
  }
}
