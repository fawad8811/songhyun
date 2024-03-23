
import 'package:songhyun/utils/app_exports.dart';

class MyNavigation {
  static Widget getPageByIndex(
      int index, GlobalKey<ScaffoldState> scaffoldKey) {
    switch (index) {
      case 0:
        return const HomeTextWidget();
      case 1:
        return const GreetingsScreen();
      case 2:
        return const VisionScreen();
      case 3:
        return const HistoryScreen();
      case 4:
        return const TeamScreen();
      case 5:
        return const PhilosophyScreen();
      case 6:
        return const StrategyScreen();
      case 7:
        return const FundScreen();
      default:
        return Container();
    }
  }

  static void handleSubmenuSelected(String value, PageController pageController,
      GlobalKey<ScaffoldState> scaffoldKey) {
    if (value == 'Greeting') {
      _navigateToPage(pageController, 1);
    } else if (value == 'Vision') {
      _navigateToPage(pageController, 2);
    } else if (value == 'History') {
      _navigateToPage(pageController, 3);
    } else if (value == 'Team') {
      _navigateToPage(pageController, 4);
    } else if (value == 'Philosophy') {
      _navigateToPage(pageController, 5);
    } else if (value == 'Strategy') {
      _navigateToPage(pageController, 6);
    }else if (value == 'Fund') {
      _navigateToPage(pageController, 7);
    }
  }

  static void _navigateToPage(PageController pageController, int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
