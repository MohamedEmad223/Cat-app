import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theme/colors_manager.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 90.h,
        height: 75.h,
        decoration: BoxDecoration(
          color: ColorManager.thirdTeal,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(title), Text(subTitle)],
        ),
      ),
    );
  }
}
