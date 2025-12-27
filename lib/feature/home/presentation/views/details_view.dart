import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helper/app_images.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/details_body.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/image_container.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/positioned_back_arrow_button.dart';

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
                  PositionedBackArrowButton(),
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
}
