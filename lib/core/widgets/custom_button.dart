import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theme/app_text_style.dart';
import 'package:pet_finder_app/core/theme/colors_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTab,
    this.isLoading,
  });

  final String title;
  final bool? isLoading;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading == true,
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.primaryTeal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          onPressed: onTab,
          child: isLoading == true
              ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : Text(title, style: AppTextStyle.fontWhite17poppins),
        ),
      ),
    );
  }
}
