import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_project/core/utils/app_svgs.dart';
import 'package:restourant_mobile_project/core/dio.dart';
import 'package:restourant_mobile_project/features/categories/widgets/product_of_category_by_filter.dart';
import 'package:restourant_mobile_project/features/common/widgets/navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:restourant_mobile_project/core/utils/app_styles.dart';
import '../../../core/utils/app_colors.dart';
import '../managers/CategoryDetailsViewModel.dart';

class MyRestaurantApp extends StatefulWidget {
  const MyRestaurantApp({
    super.key,
    required this.category,
    required this.categories,
    required this.activeIndex,
    required this.categoryId,
  });

  final Map category;
  final List categories;
  final int categoryId;
  final int activeIndex;

  @override
  State<MyRestaurantApp> createState() => _MyRestaurantAppState();
}

class _MyRestaurantAppState extends State<MyRestaurantApp> {
  String titleString = 'Breakfast';

  @override
  Widget build(BuildContext context) {
    int activeIndex = widget.activeIndex;
    return ChangeNotifierProvider(
      create: (context) => CategoryDetailsViewModel(widget.categoryId),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.backgroundColor,
          leading: Center(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: SvgPicture.asset(
                width: 21.4,
                height: 14,
                AppSvgs.backArrow,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            widget.category['title'],
            style: AppStyles.titleStyle,
          ),
          actions: [
            Row(
              spacing: 5,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  height: 28.h,
                  width: 28.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.h),
                    color: AppColors.actionIconsColor,
                  ),
                  child: SvgPicture.asset(
                    AppSvgs.notification,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  height: 28.h,
                  width: 28.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.h),
                    color: AppColors.actionIconsColor,
                  ),
                  child: SvgPicture.asset(AppSvgs.search),
                ),
              ],
            ),
            SizedBox(
              width: 37.w,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 39),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  ...List.generate(widget.categories.length, (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(
                          context,
                        ).push(
                          MaterialPageRoute(
                            builder: (context) => MyRestaurantApp(
                              category: widget.category,
                              categories: widget.categories,
                              activeIndex: widget.activeIndex,
                              categoryId: widget.categoryId,
                            ),
                          ),
                        );
                      },
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: activeIndex == index
                              ? AppColors.redPinkMain
                              : Colors.transparent,
                          foregroundColor: activeIndex == index
                              ? AppColors.whiteColor
                              : AppColors.appBarTextColor,
                        ),
                        onPressed: () {
                          activeIndex = index;
                          titleString = widget.categories[index]['title'];
                          setState(() {});
                        },
                        child: Text(
                          widget.categories[index]['title'],
                          style: AppStyles.categoriesButtonStyle,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
        body: Consumer<CategoryDetailsViewModel>(
          builder: (context, vm, child) => GridView.builder(
            padding: EdgeInsets.fromLTRB(37.w, 19.h, 37.w, 125),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18.95.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: 1 / 1.54,
            ),
            itemCount: vm.categoryDetailsList.length,
            itemBuilder: (context, index) {
              final item = vm.categoryDetailsList[index];
              final title = (item['title'] as String?) ?? '';
              return ProductOfCategoryByFilter(
                productDetails: item,
                activeIndex: activeIndex,
                appBarTitle: title,
              );
            },
          ),
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
