import 'package:songhyun/screens/investment/fund/fund_screen.dart';
import 'package:songhyun/screens/investment/philosophy/philosophy_screen.dart';
import 'package:songhyun/screens/investment/strategy/strategy_screen.dart';
import 'package:songhyun/screens/overview/greetings/greetings_screen.dart';
import 'package:songhyun/screens/overview/history/history_screen.dart';
import 'package:songhyun/screens/overview/team/team_screen.dart';
import 'package:songhyun/screens/overview/vision/vision_screen.dart';
import 'package:songhyun/screens/portfolio/portfolio_screen.dart';
import 'package:songhyun/utils/app_exports.dart';

class WebBody extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const WebBody({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  WebBodyState createState() => WebBodyState();

  static void navigateToPage(PageController pageController, int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class WebBodyState extends State<WebBody> {
  late PageController _pageController;
  late List<Widget> _pages;
  int _currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pages = [
      const HomeTextWidget(),
      const GreetingsScreen(),
      const VisionScreen(),
      const HistoryScreen(),
      const TeamScreen(),
      const PhilosophyScreen(),
      const StrategyScreen(),
      const FundScreen(),
      const PortfolioScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
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
                  setState(() {
                    if (index >= 0 && index < _pages.length) {
                      _pages[index] = MyNavigation.getPageByIndex(
                          index, widget.scaffoldKey);
                    }
                  });
                },
                onLogoTap: () {
                  setState(() {
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                onSubmenuSelected: (value) {
                  MyNavigation.handleSubmenuSelected(
                      value, _pageController, widget.scaffoldKey);
                },
              ),
              FooterContainer(
                isMainScreen: true,
                pageIndex: _currentPageIndex, // Pass current page index
              ),
            ],
          ),
        ],
      ),
    );
  }
}
