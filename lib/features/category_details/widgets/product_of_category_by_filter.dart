import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_project/core/utils/app_styles.dart';
import 'package:restourant_mobile_project/core/utils/app_svgs.dart';
import '../../recipes/pages/category_product_recipes.dart';
import 'like.dart';

class ProductOfCategoryByFilter extends StatelessWidget {
  const ProductOfCategoryByFilter({
    super.key,
    required this.appBarTitle,
    required this.activeIndex,
    required this.productDetails,
  });

  final Map productDetails;
  final String appBarTitle;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final String productDescription = productDetails['description'];
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryProductDetails(
              title: appBarTitle,
              activeIndex: activeIndex,
              productDetails: productDetails,
            ),
          ),
        );
      },
      child: SizedBox(
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
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productDetails['title'],
                      style: AppStyles.footNameStyle,
                    ),
                    SizedBox(
                      width: 128.53.w,
                      child: Text(
                        productDescription,
                        style: AppStyles.footDescriptionStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 5,
                          children: [
                            Text(
                              "${productDetails['rating']}",
                              style: AppStyles.footStarNumberStyle,
                            ),
                            SvgPicture.asset(AppSvgs.star),
                          ],
                        ),
                        Row(
                          spacing: 6,
                          children: [
                            SvgPicture.asset(AppSvgs.clock),
                            Text(
                              "${productDetails['timeRequired']}",
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
                  child: Image.network(
                    productDetails['photo'],
                    width: 169.w,
                    height: 153.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 7.h,
              left: 133.w,
              child: Like(),
            ),
          ],
        ),
      ),
    );
  }
}
