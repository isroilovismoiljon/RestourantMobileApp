import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static const TextStyle titleStyle = TextStyle(
    fontFamily: "assets/Fonts/Poppins/Poppins-SemiBold.ttf",
    color: AppColors.appBarTextColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle productTextStyle = TextStyle(
    fontSize: 14.61,
    color: AppColors.productTextColor,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle footNameStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.productTitleColor,
  );
  static TextStyle footDescriptionStyle = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 13,
    color: AppColors.productTitleColor,
  );
  static TextStyle footStarNumberStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.pinkColor,
  );
  static TextStyle categoriesButtonStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static TextStyle categoryName = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.categoryName
  );
}
