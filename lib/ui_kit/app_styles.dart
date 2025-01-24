import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyles {

  static TextStyle exoW700Black(double fontSize) {
    return TextStyle(
      fontFamily: 'Exo',
      height: 1.1,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }

  static TextStyle exoW600White(double fontSize) {
    return TextStyle(
      fontFamily: 'Exo',
      height: 1.1,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    );
  }

  static TextStyle exoW500Black(double fontSize) {
    return TextStyle(
      fontFamily: 'Exo',
      height: 1.1,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  static TextStyle exoW500DarkGrey(double fontSize) {
    return TextStyle(
      fontFamily: 'Exo',
      height: 1.1,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.darkGrey,
    );
  }

  static TextStyle exoW500White(double fontSize) {
    return TextStyle(
      fontFamily: 'Exo',
      height: 1.1,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
  }

  static TextStyle nunitoW600Black(double fontSize) {
    return TextStyle(
      fontFamily: 'Nunito',
      height: 1.1,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  static TextStyle nunitoW600White(double fontSize) {
    return TextStyle(
      fontFamily: 'Nunito',
      height: 1.1,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    );
  }

  static TextStyle quicksandW600Black(double fontSize) {
    return TextStyle(
      fontFamily: 'Quicksand',
      height: 1.1,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  static TextStyle quicksandW500Black(double fontSize) {
    return TextStyle(
      fontFamily: 'Quicksand',
      height: 1.1,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
  }

  static TextStyle quicksandW500LightBlack(double fontSize) {
    return TextStyle(
      fontFamily: 'Quicksand',
      height: 1.1,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.lightBlack,
    );
  }
}