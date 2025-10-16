import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helper/app_images.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/details_body.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/image_container.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ImageContainer(image: AppImages.details),
                  Positioned(
                    top: 16.h,
                    left: 16.w,
                    child: _buildIconButton(
                      icon: Icons.arrow_back,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    top: 16.h,
                    right: 16.w,
                    child: _buildIconButton(
                      icon: Icons.favorite_border,
                      onTap: () {
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const DetailsBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 22.sp, color: Colors.black87),
      ),
    );
  }
}
