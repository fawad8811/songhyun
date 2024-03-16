import 'package:flutter/material.dart';
import 'package:songhyun/home/home_screen.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_theme.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: const HomeScreen(),
      theme: MyAppTheme.themeDataLight,
      debugShowCheckedModeBanner: false,
    );
  }
}

