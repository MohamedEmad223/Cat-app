import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/info_container.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InfoContainer(title: 'Gender', subTitle: "Male"),
        SizedBox(width: 8.w),
        InfoContainer(title: 'Age', subTitle: "1 Year"),
        SizedBox(width: 8.w),
        InfoContainer(title: 'Weight', subTitle: "70 kg"),
      ],
    );
  }
}