import 'package:songhyun/utils/app_exports.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig().init(context);
    return MaterialApp(
      // home: const PortfolioScreen(),
      home: ResponsiveLayout(
        mobileBody: MobileScaffold(
          scaffoldKey: scaffoldKey,
        ),
        webBody: WebBody(
          scaffoldKey: scaffoldKey,
        ),
      ),
      theme: MyAppTheme.themeDataLight,
      debugShowCheckedModeBanner: false,
    );
  }
}
