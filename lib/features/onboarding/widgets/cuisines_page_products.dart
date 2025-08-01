import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_project/core/utils/app_styles.dart';

class CuisinesPageProducts extends StatelessWidget {
  const CuisinesPageProducts({
    super.key,
    required this.cuisine,
  });

  final dynamic cuisine;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11.74),
            child: Image.network(
              cuisine['image'],
              height: 98.63.h,
              width: 98.23.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 4),
          Text(
            cuisine['title'],
            textAlign: TextAlign.center,
            style: AppStyles.cuisinesItemTitle,
          ),
        ],
      ),
    );
  }
}
