import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LableText extends StatelessWidget {
  const LableText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
