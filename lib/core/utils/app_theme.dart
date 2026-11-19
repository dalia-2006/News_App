import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.whiteBgColor,
      canvasColor: AppColors.lightGray,
dividerColor: AppColors.whiteColor,
    cardColor: AppColors.black,
    textTheme: TextTheme(
      bodyLarge: AppStyles.med20black,
      bodyMedium: AppStyles.reg18black,
      bodySmall: AppStyles.bold20black,
      displayLarge: AppStyles.med20white
    )

  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    dividerColor: AppColors.darkGray,
    scaffoldBackgroundColor: AppColors.blackBgColor,
      canvasColor: AppColors.darkGray,
    cardColor: AppColors.whiteColor,
    textTheme: TextTheme(
      bodyLarge: AppStyles.med20white,
      bodyMedium: AppStyles.reg18white,
      bodySmall: AppStyles.bold20white,
        displayLarge: AppStyles.med20black

    ),

  );
}