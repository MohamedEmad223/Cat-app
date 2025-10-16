import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helper/app_images.dart';

class NamePriceDistance extends StatelessWidget {
  const NamePriceDistance({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tom',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.location,
                  width: 16.w,
                  height: 16.h,
                  color: Colors.red,
                ),
                SizedBox(width: 4.w),
                Text(
                  '2.7 km away',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
    
        const Spacer(),
    
        Text(
          '\$95',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3EC1C9),
          ),
        ),
      ],
    );
  }
}