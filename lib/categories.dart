import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_project/core/utils/app_styles.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.imageAsset,
    required this.categoryText,
  });

  final String imageAsset;
  final String categoryText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.61),
          child: Image.asset(
            imageAsset,
            width: 158.w,
            height: 144.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          categoryText,
          style: AppStyles.productTextStyle,
        ),
      ],
    );
  }
}
