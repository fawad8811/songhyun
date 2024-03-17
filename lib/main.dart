import 'package:flutter/material.dart';
import 'package:songhyun/responsive/web_body.dart';
import 'package:songhyun/responsive/mobile_body.dart';
import 'package:songhyun/responsive/responsive_layout.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: const ResponsiveLayout(
        mobileBody: MobileScaffold(),
        webBody: WebBody(),
      ),
      theme: MyAppTheme.themeDataLight,
      debugShowCheckedModeBanner: false,
    );
  }
}
