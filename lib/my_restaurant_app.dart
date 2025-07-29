import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restourant_mobile_project/product_of_category_by_filter.dart';
import 'package:restourant_mobile_project/recipe_bottom_navigation_bar.dart';
import 'package:restourant_mobile_project/core/utils/app_lists.dart';
import 'package:restourant_mobile_project/core/utils/app_styles.dart';
import 'core/utils/app_colors.dart';

class MyRestaurantApp extends StatefulWidget {
  const MyRestaurantApp({super.key});

  @override
  State<MyRestaurantApp> createState() => _MyRestaurantAppState();
}

class _MyRestaurantAppState extends State<MyRestaurantApp> {
  /*List<Map> list = [
    {
      "image": "assets/Images/Categories/lunch.png",
      "title": "Lunch",
    },
    {
      "image": "assets/Images/Categories/breakfast.png",
      "title": "Breakfast",
    },
    {
      "image": "assets/Images/Categories/dinner.png",
      "title": "Dinner",
    },
    {
      "image": "assets/Images/Categories/vegan.png",
      "title": "Vegan",
    },
    {
      "image": "assets/Images/Categories/dessert.png",
      "title": "Dessert",
    },
    {
      "image": "assets/Images/Categories/drinks.png",
      "title": "Drinks",
    },
    {
      "image": "assets/Images/Categories/drinks.png",
      "title": "Drinks",
    },
    {
      "image": "assets/Images/Categories/dessert.png",
      "title": "Dessert",
    },
    {
      "image": "assets/Images/Categories/lunch.png",
      "title": "Lunch",
    },
    {
      "image": "assets/Images/Categories/breakfast.png",
      "title": "Breakfast",
    },
  ];*/
  final int counterListIndex = 0;

  int activeIndex = 0;
  List<String> CategoriesName = [
    'Breakfast',
    'Cookies',
    'Dessert',
    'Dinner',
    'Drinks',
  ];
  String TitleString = 'Breakfast';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        leading: Center(
          child: SvgPicture.asset(
            width: 21.4,
            height: 14,
            "assets/Icons/back-arrow.svg",
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          TitleString,
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
                  "assets/Icons/notification.svg",
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
                child: SvgPicture.asset("assets/Icons/search.svg"),
              ),
            ],
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
                ...List.generate(5, (index) {
                  return TextButton(
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
                      TitleString = CategoriesName[index];
                      setState(() {});
                    },
                    child: Text(
                      CategoriesName[index],
                      style: AppStyles.categoriesButtonStyle,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),

      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 37.h, vertical: 19),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18.95.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 1 / 1.54,
        ),
        itemCount: AppLists.productsBreakfastList.length,
        itemBuilder: (context, index) {
          return activeIndex == 0
              ? ProductOfCategoryByFilter(
            imageAsset: AppLists.productsBreakfastList[index]['image'],
            titleText: AppLists.productsBreakfastList[index]['title'],
            descriptionText: AppLists.productsBreakfastList[index]['description'],
            preparedTime: AppLists.productsBreakfastList[index]['time'],
            starNumber: AppLists.productsBreakfastList[index]['star'],
          )
              : activeIndex == 1
              ? ProductOfCategoryByFilter(
            imageAsset: AppLists.productsCookiesList[index]['image'],
            titleText: AppLists.productsBreakfastList[index]['title'],
            descriptionText: AppLists.productsCookiesList[index]['description'],
            preparedTime: AppLists.productsCookiesList[index]['time'],
            starNumber: AppLists.productsCookiesList[index]['star'],
          )
              : activeIndex == 2
              ? ProductOfCategoryByFilter(
            imageAsset: AppLists.productsDessertList[index]['image'],
            titleText: AppLists.productsDessertList[index]['title'],
            descriptionText: AppLists.productsDessertList[index]['description'],
            preparedTime: AppLists.productsDessertList[index]['time'],
            starNumber: AppLists.productsDessertList[index]['star'],
          )
              : activeIndex == 3
              ? ProductOfCategoryByFilter(
            imageAsset: AppLists.productsBreakfastList[index]['image'],
            titleText: AppLists.productsBreakfastList[index]['title'],
            descriptionText: AppLists.productsBreakfastList[index]['description'],
            preparedTime: AppLists.productsBreakfastList[index]['time'],
            starNumber: AppLists.productsBreakfastList[index]['star'],
          )
              : ProductOfCategoryByFilter(
            imageAsset: AppLists.productsBreakfastList[index]['image'],
            titleText: AppLists.productsBreakfastList[index]['title'],
            descriptionText: AppLists.productsBreakfastList[index]['description'],
            preparedTime: AppLists.productsBreakfastList[index]['time'],
            starNumber: AppLists.productsBreakfastList[index]['star'],
          );
        },
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
