import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/app_bar_row.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/categories_list.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/lable_text.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/list_view_of_pets.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/search_text_foem_feild.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarRow(),
                SizedBox(height: 16.h),
                SearchTextFoemFeild(),
                SizedBox(height: 20.h),
                LableText(title: 'Categories',),
                SizedBox(height: 10.h),
                CategoriesList(),
                SizedBox(height: 20.h),
                ListViewOfPets()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
