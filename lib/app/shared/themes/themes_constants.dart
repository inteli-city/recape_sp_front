import 'package:recape_sp_front/app/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.all<Color>(AppColors.primaryBlue),
    thumbColor: WidgetStateProperty.all<Color>(AppColors.white),
  ),
  dialogTheme: DialogTheme(
    surfaceTintColor: AppColors.white,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
  primaryColor: AppColors.primaryBlue,
  scaffoldBackgroundColor: AppColors.white,
  buttonTheme: ButtonThemeData(buttonColor: AppColors.primaryBlue),
  textTheme: TextTheme(
    displayLarge: AppTextStyles.headline1,
    displayMedium: AppTextStyles.headline2,
    displaySmall: AppTextStyles.headline3,
    bodyLarge: AppTextStyles.bodyText1,
    bodyMedium: AppTextStyles.bodyText2,
    titleMedium: AppTextStyles.subtitle1,
    titleSmall: AppTextStyles.subtitle2,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all<TextStyle>(AppTextStyles.bodyText1),
      foregroundColor: WidgetStateProperty.all<Color>(AppColors.primaryBlue),
    ),
  ),
  progressIndicatorTheme:
      ProgressIndicatorThemeData(color: AppColors.primaryBlue),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
    backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryBlue),
    shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
  )),
);

ThemeData darkTheme = ThemeData(
  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.all<Color>(AppColors.primaryBlue),
    thumbColor: WidgetStateProperty.all<Color>(AppColors.white),
  ),
  textTheme: TextTheme(
    displayLarge: AppTextStyles.headline1.copyWith(color: AppColors.white),
    displayMedium: AppTextStyles.headline2.copyWith(color: AppColors.white),
    displaySmall: AppTextStyles.headline3.copyWith(color: AppColors.white),
    bodyLarge: AppTextStyles.bodyText1.copyWith(color: AppColors.white),
    bodyMedium: AppTextStyles.bodyText2.copyWith(color: AppColors.white),
    titleMedium: AppTextStyles.subtitle1.copyWith(color: AppColors.white),
    titleSmall: AppTextStyles.subtitle2.copyWith(color: AppColors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
          shape: WidgetStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
          overlayColor: WidgetStateProperty.all<Color>(Colors.black26))),
);
