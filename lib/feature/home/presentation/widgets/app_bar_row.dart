import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Find Your Forever Pet",
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.notifications_none, size: 26.sp),
      ],
    );
  }
}
