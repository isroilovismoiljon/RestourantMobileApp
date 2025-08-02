import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_project/core/dio.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/app_svgs.dart';
import '../../common/widgets/navigation_bar/recipe_bottom_navigation_bar.dart';
import '../managers/ProductRecipesViewModel.dart';

class CategoryProductDetails extends StatefulWidget {
  const CategoryProductDetails({
    super.key,
    required this.title,
    required this.productDetails,
  });

  final String title;
  final Map productDetails;

  @override
  State<CategoryProductDetails> createState() => _CategoryProductDetailsState();
}

class _CategoryProductDetailsState extends State<CategoryProductDetails> {
  bool follow = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductRecipesViewModel(widget.productDetails['id']),
      child: Scaffold(
      extendBody: true,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            AppSvgs.backArrow,
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: AppStyles.titleStyle,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 28.w,
              height: 28.h,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.w),
                color: AppColors.lightPinkColor,
              ),
              child: SvgPicture.asset(
                AppSvgs.heart,
                colorFilter: ColorFilter.mode(
                  AppColors.subPinkColor,
                  BlendMode.modulate,
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          InkWell(
            onTap: () {},
            child: Container(
              width: 28.w,
              height: 28.h,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.w),
                color: AppColors.lightPinkColor,
              ),
              child: SvgPicture.asset(
                AppSvgs.share,
                colorFilter: ColorFilter.mode(
                  AppColors.subPinkColor,
                  BlendMode.modulate,
                ),
              ),
            ),
          ),
          SizedBox(width: 37.w),
        ],
      ),
      body: Consumer<ProductRecipesViewModel>(builder: (context, vm, child) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(37.w, 20.h, 37.w, 126.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 31.h,
            children: [
              SizedBox(
                width: 357.w,
                height: 337.h,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 16.h,
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.redPinkMain,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            vm.productRecipes['title'],
                            style: AppStyles.productName,
                          ),
                          SizedBox(
                            width: 90.65.w,
                            height: 18.w,
                            child: Row(
                              spacing: 5,
                              children: [
                                SvgPicture.asset(AppSvgs.starFilled),
                                Text(
                                  "${vm.productRecipes["rating"]}",
                                  style: AppStyles.footStarNumberStyle,
                                ),
                                SvgPicture.asset(AppSvgs.reviews),
                                Text(
                                  "2.273",
                                  style: AppStyles.footStarNumberStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          vm.productRecipes['photo'],
                          width: double.infinity,
                          height: 281.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 105.h,
                      left: 142.w,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                          23.66,
                          17.87,
                          20.42,
                          13.52,
                        ),
                        width: 74.01.w,
                        height: 71.46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(37),
                          color: AppColors.redPinkMain,
                        ),
                        child: SvgPicture.asset(AppSvgs.play),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                spacing: 20,
                children: [
                  Row(
                    spacing: 15,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          vm.productRecipes['user']['profilePhoto'],
                          width: 61.w,
                          height: 63.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 132.87.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@${vm.productRecipes['username']}",
                              style: AppStyles.chefProfileUsernameStyle,
                            ),
                            Text(
                              "${vm.productRecipes['firstName']} ${vm.productRecipes['lastName']}",
                              style: AppStyles.chefFullName,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.pinkColor,
                          fixedSize: Size(109, 21),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          follow = !follow;
                          setState(() {});
                        },
                        child: Text(
                          follow ? "Following" : "Follow",
                          style: AppStyles.follow,
                        ),
                      ),
                      SvgPicture.asset(
                        AppSvgs.threeDots,
                        width: 4.03.w,
                        height: 15.h,
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.subPinkColor,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    spacing: 7,
                    children: [
                      Text(
                        "Details  ",
                        style: AppStyles.titleStyle,
                      ),
                      SvgPicture.asset(
                        AppSvgs.clock,
                        colorFilter: ColorFilter.mode(
                          AppColors.whiteColor,
                          BlendMode.modulate,
                        ),
                      ),
                      Text(
                        "${vm.productRecipes['timeRequired']}min",
                        style: AppStyles.contentText,
                      ),
                    ],
                  ),
                  Text(
                    vm.productRecipes['description'],
                    style: AppStyles.contentText,
                    maxLines: 2,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ingredients",
                    style: AppStyles.titleStyle,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(vm.productRecipes['ingredients'].length, (index) {
                        final ingredients = vm.productRecipes['ingredients'];
                        return Row(
                          children: [
                            Text(
                              "•  ",
                              style: AppStyles.contentRedText,
                            ),
                            Text(
                              "${ingredients[index]['amount']} ",
                              style: AppStyles.contentRedText,
                            ),
                            Text(
                              "${ingredients[index]['name']}",
                              style: AppStyles.contentText,
                            ),
                          ],
                        );
                      }),

                    ],
                  ),
                  SizedBox(height: 31.h,),
                  Text(
                    "${vm.productRecipes['instructions'].length} Easy Steps",
                    style: AppStyles.titleStyle,
                  ),
                  SizedBox(height: 5.h,),
                  Column(
                    spacing: 11,
                    children: [
                      ...List.generate(vm.productRecipes['instructions'].length, (index) {
                        final instructions = vm.productRecipes['instructions'];
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: 0, left: 10, top: 15, bottom: 12),
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? AppColors.pinkColor
                                : AppColors.lightPinkColor,
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          width: 356.w,
                          height: 81.h,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 340.w,
                                height: 56.h,
                                child: Text(
                                  "${instructions[index]['order']}. ${instructions[index]['text']}",
                                  style: AppStyles.contentText,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          RecipeBottomNavigationBar(),
        ],
      ),
    )
    );
  }
}
