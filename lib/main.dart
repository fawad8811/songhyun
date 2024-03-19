import 'package:flutter/material.dart';
import 'package:songhyun/screens/greetings/greetings_screen.dart';
import 'package:songhyun/screens/home/responsive/mobile_body.dart';
import 'package:songhyun/screens/home/responsive/responsive_layout.dart';
import 'package:songhyun/screens/home/responsive/web_body.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_theme.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const ResponsiveLayout(
        mobileBody: MobileScaffold(),
        webBody: WebBody(),
      ),
  '/greetings': (context) => const GreetingsScreen()
  // '/greetings': (context) => const Scaffold(
  //       body: GreetingsScreen(),
  //       bottomNavigationBar: FooterContainer(),
  //     ),
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      // home: const ResponsiveLayout(
      //   mobileBody: MobileScaffold(),
      //   webBody: WebBody(),
      // ),
      routes: routes,
      theme: MyAppTheme.themeDataLight,
      debugShowCheckedModeBanner: false,
    );
  }
}
