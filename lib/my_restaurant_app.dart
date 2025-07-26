import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_project/categories.dart';
import 'package:restourant_mobile_project/recipe_bottom_navigation_bar.dart';
import 'package:restourant_mobile_project/utils/app_styles.dart';

import 'bottom_navigation_bar_gradient.dart';
import 'utils/app_colors.dart';

class MyRestaurantApp extends StatefulWidget {
  const MyRestaurantApp({super.key});

  @override
  State<MyRestaurantApp> createState() => _MyRestaurantAppState();
}

class _MyRestaurantAppState extends State<MyRestaurantApp> {
  List<Map> list = [
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
  ];

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
          "Categories",
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
          SizedBox(
            width: 37,
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 37.h, vertical: 19),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 38.91.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: 1 / 1.18,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Categories(imageAsset: list[index]["image"], categoryText: list[index]['title'],);
        },
        /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 2,
        ),
        itemCount: 2,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 168.53.w,
            height: 226.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    alignment: Alignment.bottomCenter,
                    width: 158.53.w,
                    height: 226.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text("Baked Chicken"),
                            SizedBox(
                              width: 128.53.w,
                              child: Text("Delicious and juicy wings"),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("5"), Text("30 min")],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      "assets/Images/Categories/breakfast.png",
                      width: 169.w,
                      height: 153.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },*/
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
