import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_project/core/utils/app_styles.dart';
import 'core/utils/app_colors.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int activeIndex;
  const MyAppBar({
    super.key,
    required this.activeIndex
  });

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 110.h);
}

class _MyAppBarState extends State<MyAppBar> {
  late int activeIndex;
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
    return AppBar(
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
                    backgroundColor: widget.activeIndex == index
                        ? AppColors.redPinkMain
                        : Colors.transparent,
                    foregroundColor: widget.activeIndex == index
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
    );
  }
}
