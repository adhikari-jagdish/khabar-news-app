import 'package:flutter/material.dart';
import 'package:khabar_news_app/constants/color_constants.dart';

class Themes {
  static final appTheme = ThemeData(
    primaryColor: AppColors.blue1072A0,
    scaffoldBackgroundColor: AppColors.white,
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.blue0982BA),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.blue1072A0),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.blue0AAABD),
  );
}
