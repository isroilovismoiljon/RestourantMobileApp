import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restourant_mobile_project/core/utils/app_colors.dart';
import 'package:restourant_mobile_project/core/utils/app_styles.dart';
import 'package:restourant_mobile_project/features/onboarding/widgets/cuisines_page_products.dart';
import 'package:restourant_mobile_project/features/onboarding/widgets/cuisines_page_next_page_button.dart';

import '../managers/cuisines_view_model.dart';

class CuisinesPage extends StatelessWidget {
  const CuisinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CuisinesViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,

        body: Padding(
          padding: const EdgeInsets.only(
            top: 82.65,
            right: 36,
            left: 37,
            bottom: 59.65,
          ),
          child: Column(
            spacing: 20,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 230.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: AppColors.pageViewWhiteButton,
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.topLeft,
                child: Container(
                  width: 65.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.redPinkMain,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              SizedBox(height: 35.h,),
              Text(
                "Select your cuisines preferences",
                style: AppStyles.cuisinesTitle,
              ),
              Text(
                "Please select your cuisines preferences for a better recommendations or you can skip it.",
                style: AppStyles.cuisinesDescription,
              ),
              Expanded(
                child: Consumer<CuisinesViewModel>(
                  builder: (context, vm, child) {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 140,
                          ),
                      itemCount: vm.cuisines.length,
                      itemBuilder: (context, index) {
                        final cuisine = vm.cuisines[index];
                        return CuisinesPageProducts(cuisine: cuisine);
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CuisinesPageNextPageButton(
                    title: 'Skip',
                    boxColor: AppColors.actionIconsColor,
                    textStyle: AppStyles.skipButtonText,
                  ),
                  CuisinesPageNextPageButton(
                    title: 'Continue',
                    boxColor: AppColors.redPinkMain,
                    textStyle: AppStyles.continueButtonText,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
