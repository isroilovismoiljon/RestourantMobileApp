import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_project/core/utils/app_colors.dart';
import 'package:restourant_mobile_project/core/utils/app_styles.dart';

class CuisinesPageNextPageButton extends StatelessWidget {
  const CuisinesPageNextPageButton({
    super.key, required this.title, required this.boxColor, required this.textStyle,
  });

  final String title;
  final Color boxColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: boxColor,
        fixedSize: Size(
          162.w,
          45.h,
        ),
      ),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
