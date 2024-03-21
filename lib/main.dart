
import 'package:songhyun/utils/app_exports.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// final Map<String, WidgetBuilder> routes = {
//   '/': (context) =>  ResponsiveLayout(
//         mobileBody: MobileScaffold(scaffoldKey: scaffoldKey,),
//         webBody: WebBody(scaffoldKey: scaffoldKey,),
//       ),
//   '/greetings': (context) =>  GreetingsScreen(scaffoldKey: scaffoldKey,)
//   // '/greetings': (context) => const Scaffold(
//   //       body: GreetingsScreen(),
//   //       bottomNavigationBar: FooterContainer(),
//   //     ),
// };

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveConfig().init(context);
    return MaterialApp(
      home: ResponsiveLayout(
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
