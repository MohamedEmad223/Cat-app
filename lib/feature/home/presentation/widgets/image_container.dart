import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theme/colors_manager.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        color: ColorManager.secondTeal,
      ),
      child: Image.asset(
        image,
        width: double.infinity,
        height: 300.h,
      ),
    );
  }
}
