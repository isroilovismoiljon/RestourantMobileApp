import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_project/features/common/widgets/navigation_bar/recipe_bottom_navigation_bar.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/app_svgs.dart';
import '../../../core/dio.dart';
import '../managers/CategoriesViewModel.dart';
import '../widgets/foots_template.dart';

Future<List> fetchCategoriesList() async {
  var categories = await dio.get("/categories/list");
  if (categories.statusCode != 200) {
    throw Exception(categories.data);
  }
  return categories.data;
}


class MyCategoriesPage extends StatefulWidget {
  const MyCategoriesPage({super.key});

  @override
  State<MyCategoriesPage> createState() => _MyCategoriesPageState();
}

class _MyCategoriesPageState extends State<MyCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> CategoriesViewModel(),
      child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(AppSvgs.backArrow),
        ),
        centerTitle: true,
        title: Text("Categories", style: AppStyles.titleStyle),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 28.w,
              height: 28.h,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.w),
                color: AppColors.actionIconsColor,
              ),
              child: SvgPicture.asset(AppSvgs.notification),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 28.w,
              height: 28.h,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.w),
                color: AppColors.actionIconsColor,
              ),
              child: SvgPicture.asset(AppSvgs.search),
            ),
          ),
          SizedBox(
            width: 37.w,
          ),
        ],
      ),
      body: Consumer<CategoriesViewModel>(builder: (context, vm, child)=> GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 14.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 38.9.w,
            childAspectRatio: 1 / 1.19,
          ),
          itemCount: vm.categories.length,
          itemBuilder: (context, index) {
            return FootsTemplate(
              index: index,
              category: vm.categories[index],
              categories: vm.categories,
              categoryId: vm.categories[index]['id'],
            );
          },
        )),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          RecipeBottomNavigationBar(),
        ],
      ),
    ),
    );
  }
}
