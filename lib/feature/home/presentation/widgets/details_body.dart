import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/widgets/custom_button.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/info_widget.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/lable_text.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/name_price_distance.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          NamePriceDistance(),
          SizedBox(height: 30.h),
          InfoWidget(),
          SizedBox(height: 20.h),
          LableText(title: "About:"),
          Text(
            'Tom is a playful and loyal Golden Retriever\n who loves being around people.\n He’s 1 years old, full of energy, and always\n ready for a game of fetch.\n Tom enjoys morning walks, belly rubs, and\n taking long naps after playtime.\n He’s gentle with\n kids, gets along well with other pets, and makes the perfect family\n companion.',
          ),
          SizedBox(height: 20.h),
          CustomButton(isLoading: false, title: "Adopt Me", onTab: () {}),
        ],
      ),
    );
  }
}
