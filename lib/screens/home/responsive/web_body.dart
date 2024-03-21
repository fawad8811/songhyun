
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

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
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
                  setState(() {
                    if (index >= 0 && index < _pages.length) {
                      _pages[index] = MyNavigation.getPageByIndex(
                          index, widget.scaffoldKey);
                    }
                  });
                },
                onLogoTap: () {
                  // Handle logo tap here, for example, navigate to the home screen
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
              const FooterContainer(
                isMainScreen: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyNavigation {
  static Widget getPageByIndex(
      int index, GlobalKey<ScaffoldState> scaffoldKey) {
    switch (index) {
      case 0:
        return const HomeTextWidget();
      case 1:
        return GreetingsScreen(
          scaffoldKey: scaffoldKey,
        );
      case 2:
        return VisionScreen(
          scaffoldKey: scaffoldKey,
        );
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
