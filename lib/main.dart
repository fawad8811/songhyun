
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
      home:
      //  HistoryScreen(scaffoldKey: scaffoldKey),
      ResponsiveLayout(
        mobileBody: MobileScaffold(
          scaffoldKey: scaffoldKey,
        ),
        webBody: WebBody(
          scaffoldKey: scaffoldKey,
        ),
      ),
      // routes: routes,
      theme: MyAppTheme.themeDataLight,
      debugShowCheckedModeBanner: false,
    );
  }
}
