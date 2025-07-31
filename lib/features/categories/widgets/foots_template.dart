import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restourant_mobile_project/features/categories/pages/category_details.dart';
import '../../../core/utils/app_styles.dart';

class FootsTemplate extends StatelessWidget {
  const FootsTemplate({
    super.key,
    required this.index,
    required this.category,
    required this.categories, required this.categoryId,
  });

  final Map category;
  final List categories;
  final int index;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(
          MaterialPageRoute(
            builder: (context) => MyRestaurantApp(
              category: category,
              categories: categories,
              activeIndex: index,
              categoryId: categoryId,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.61),
            child: Image.network(
              category['image'],
              width: 158.55.w,
              height: 145.39.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            category['title'],
            style: AppStyles.categoryName,
          ),
        ],
      ),
    );
  }
}
