import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_project/core/utils/app_styles.dart';

class ProductOfCategoryByFilter extends StatelessWidget {
  const ProductOfCategoryByFilter({
    super.key, required this.imageAsset, required this.titleText, required this.descriptionText, required this.preparedTime, required this.starNumber,
  });

  final String imageAsset, titleText, descriptionText,  preparedTime;
  final String starNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168.53.w,
      height: 230.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              alignment: Alignment.bottomCenter,
              width: 158.53.w,
              height: 230.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    titleText,
                    style: AppStyles.footNameStyle,
                  ),
                  SizedBox(
                    width: 128.53.w,
                    child: Text(
                      descriptionText,
                      style: AppStyles.footDescriptionStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Text(
                            starNumber,
                            style: AppStyles.footStarNumberStyle,
                          ),
                          SvgPicture.asset("assets/Icons/star.svg"),
                        ],
                      ),
                      Row(
                        spacing: 6,
                        children: [
                          SvgPicture.asset("assets/Icons/clock.svg"),
                          Text(
                            preparedTime,
                            style: AppStyles.footStarNumberStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 5,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  imageAsset,
                  width: 169.w,
                  height: 153.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
