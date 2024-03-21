import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class MyAppTheme {
  static ThemeData themeDataLight = ThemeData(
      // primarySwatch: AppColors.primarySwatch,
      primaryColor: AppColors.kBlack,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.kBlack, brightness: Brightness.light),
      indicatorColor: AppColors.kBlack,
      appBarTheme: appBarThemeLight,
      fontFamily: "noto",
      textTheme: textThemeLight,
      scaffoldBackgroundColor: AppColors.kMainBackgroundColor,
      inputDecorationTheme: textFieldThemeLight,
      textButtonTheme: textButtonThemeDataLight,
      elevatedButtonTheme: elevatedButtonThemeLight,
      checkboxTheme: checkboxThemeDataLight);

  static TextTheme textThemeLight = const TextTheme(
      titleSmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.kBlack),
      // body small for hints
      bodySmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.kBlack),
      // body medium for normal text
      bodyMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.kBlack),
      labelMedium: TextStyle(fontSize: 15,fontWeight: FontWeight.w100, color: AppColors.kBlack),
      labelLarge: TextStyle(fontSize: 20,fontWeight: FontWeight.w400, color: AppColors.kBlack),
      titleLarge: TextStyle(fontSize: 50,fontWeight: FontWeight.w100, color: AppColors.kBlack),
      displayLarge: TextStyle(fontSize: 50));
  static InputDecorationTheme textFieldThemeLight = InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.kDarkGrey),
      errorMaxLines: 2);
  static ElevatedButtonThemeData elevatedButtonThemeLight =
      ElevatedButtonThemeData(
          style: ButtonStyle(
    minimumSize: MaterialStateProperty.all(
        Size(ResponsiveConfig.screenWidth, getProportionateScreenHeight(52))),
    maximumSize: MaterialStateProperty.all(
        Size(ResponsiveConfig.screenWidth, getProportionateScreenHeight(52))),
    backgroundColor: MaterialStateProperty.all(AppColors.kBlack),
    foregroundColor: MaterialStateProperty.all(AppColors.kWhite),
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    textStyle: MaterialStateProperty.all(
        textThemeLight.labelMedium!.copyWith(color: AppColors.kWhite)),
  ));
  static CheckboxThemeData checkboxThemeDataLight = CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColors.kWhite),
      overlayColor: MaterialStateProperty.all(AppColors.kBlack),
      side: const BorderSide(color: AppColors.kBlack, width: 2),
      // fillColor: MaterialStateProperty.all(AppColors.kBlack),
      shape: const CircleBorder());
  static AppBarTheme appBarThemeLight = const AppBarTheme(
    backgroundColor: AppColors.kMainBackgroundColor,
    surfaceTintColor: AppColors.kMainBackgroundColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.kGrey,
      statusBarBrightness: Brightness.light, //icon color for ios
    ),
  );
  static TextButtonThemeData textButtonThemeDataLight = TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(AppColors.kBlack),
          textStyle: MaterialStateProperty.all(textThemeLight.bodyMedium)));
}
