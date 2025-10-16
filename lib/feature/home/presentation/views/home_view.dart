import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helper/app_images.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/categories_list.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Find Your Forever Pet",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.notifications_none, size: 26.sp),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              border: InputBorder.none,

                              suffixIcon: Icon(
                                Icons.tune,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                CategoriesList(),
                SizedBox(height: 20.h),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    //final pet = pets[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x1A000000),
                            blurRadius: 4,
                            spreadRadius: 0.5,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.asset(
                              AppImages.cat,
                              width: 112.w,
                              height: 112.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'pet.name',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 6.w),
                                Text(
                                  'pet.gender',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(height: 6.w),
                                Text(
                                  'pet.age',
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(height: 20.w),
                                Row(
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Image.asset(
                                      AppImages.location,
                                      width: 18.w,
                                      height: 18.h,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      'pet.distance',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.teal,
                              size: 26.sp,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
