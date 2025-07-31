import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_project/core/utils/app_styles.dart';
import 'package:restourant_mobile_project/core/utils/app_svgs.dart';
import '../../../../core/utils/app_colors.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {

  const MyAppBar({super.key, this.activeIndex = 0, required this.titleString});
  final int activeIndex;
  final String titleString;

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}

class _MyAppBarState extends State<MyAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.backgroundColor,
      leading: IconButton(
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
      title: Text(
        widget.titleString,
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
      ],
      // bottom: PreferredSize(
      //   preferredSize: Size(double.infinity, 39),
      //   child: SingleChildScrollView(
      //     scrollDirection: Axis.horizontal,
      //     child: Row(
      //       spacing: 10,
      //       children: [
      //         SizedBox(
      //           width: 25,
      //         ),
      //         ...List.generate(5, (index) {
      //           return TextButton(
      //             style: TextButton.styleFrom(
      //               backgroundColor: widget.activeIndex == index
      //                   ? AppColors.redPinkMain
      //                   : Colors.transparent,
      //               foregroundColor: widget.activeIndex == index
      //                   ? AppColors.whiteColor
      //                   : AppColors.appBarTextColor,
      //             ),
      //             onPressed: () {
      //               activeIndex = index;
      //               TitleString = CategoriesName[index];
      //               setState(() {});
      //             },
      //             child: Text(
      //               CategoriesName[index],
      //               style: AppStyles.categoriesButtonStyle,
      //             ),
      //           );
      //         }),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
