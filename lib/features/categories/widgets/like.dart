import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_svgs.dart';

class Like extends StatefulWidget {
  const Like({
    super.key,
  });

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28.w,
      height: 28.h,
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: like ? AppColors.redPinkMain : AppColors.likePinkColor,
        ),
        onPressed: () {
          like = !like;
          setState(() {});
        },
        icon: SvgPicture.asset(
          AppSvgs.heart,
          colorFilter: ColorFilter.mode(
            like ? AppColors.whiteColor : AppColors.redPinkMain,
            BlendMode.modulate,
          ),
        ),
      ),
    );
  }
}
