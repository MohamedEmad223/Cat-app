import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helper/app_images.dart';

class ListViewOfPets extends StatelessWidget {
  const ListViewOfPets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
                );
  }
}