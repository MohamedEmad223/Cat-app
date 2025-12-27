import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({super.key, this.onChanged});

    final ValueChanged<String>? onChanged;


  @override
  Widget build(BuildContext context) {
    return Row(
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
                onChanged: onChanged,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  border: InputBorder.none,

                  suffixIcon: Icon(Icons.tune, color: Colors.black54),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
