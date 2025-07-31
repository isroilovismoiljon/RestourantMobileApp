import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_project/core/utils/app_colors.dart';

class LoginOrRegisterButton extends StatelessWidget {
  const LoginOrRegisterButton({
    super.key,
    required this.buttonText,
    this.buttonTextColor = AppColors.subPinkColor,
    this.buttonBackgroundColor = AppColors.lightPinkColor,
    required this.onPressed,
  });

  final String buttonText;
  final Color buttonTextColor;
  final Color buttonBackgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: buttonBackgroundColor,
        fixedSize: Size(207.w, 45.h),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: buttonTextColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
