import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restourant_mobile_project/core/utils/app_svgs.dart';
import 'package:restourant_mobile_project/core/utils/dio.dart';
import 'package:restourant_mobile_project/features/category_details/widgets/product_of_category_by_filter.dart';
import 'package:restourant_mobile_project/features/common/widgets/navigation_bar/recipe_bottom_navigation_bar.dart';
import 'package:restourant_mobile_project/core/utils/app_styles.dart';
import '../../../core/utils/app_colors.dart';

class MyRestaurantApp extends StatefulWidget {
  const MyRestaurantApp({
    super.key,
    required this.category,
    required this.categories,
    required this.activeIndex,
  });

  final Map category;
  final List categories;
  final int activeIndex;

  @override
  State<MyRestaurantApp> createState() => _MyRestaurantAppState();
}

class _MyRestaurantAppState extends State<MyRestaurantApp> {

  Future<List> fetchCategoryDetails() async {
    var categoryDetails = await DioClient.dio.get(
      "/recipes/list?Category=${widget.category['id']}",
    );
    if (categoryDetails.statusCode != 200) {
      throw Exception(categoryDetails.data);
    }
    return categoryDetails.data;
  }

  Future<List> fetchCategories() async {
    var categoryDetails = await DioClient.dio.get(
      "/categories/list",
    );
    if (categoryDetails.statusCode != 200) {
      throw Exception(categoryDetails.data);
    }
    return categoryDetails.data;
  }

  String titleString = 'Breakfast';

  @override
  Widget build(BuildContext context) {
    late int activeIndex = widget.activeIndex;
    return FutureBuilder(
      future: fetchCategoryDetails(),
      builder: (context, snapshot) {
        final data = snapshot.data!;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return Scaffold(
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
                SizedBox(width: 37.w,)
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MyRestaurantApp(
                                  category: widget.categories[activeIndex],
                                  categories: widget.categories,
                                  activeIndex: activeIndex,
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
            body: GridView.builder(
              padding: EdgeInsets.fromLTRB(37.w, 19.h, 37.w, 125),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18.95.w,
                mainAxisSpacing: 8.h,
                childAspectRatio: 1 / 1.54,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                final title = (item['title'] as String?) ?? '';
                return ProductOfCategoryByFilter(
                  productDetails: item,
                  activeIndex: activeIndex,
                  appBarTitle: title,
                );
              },
            ),
            bottomNavigationBar: RecipeBottomNavigationBar(),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text("Something went wrong!"),
            ),
          );
        }
      },
    );
  }
}
