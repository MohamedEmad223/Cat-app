import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionedBackArrowButton extends StatelessWidget {
  const PositionedBackArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.h,
      left: 16.w,
      child: _buildIconButton(
        icon: Icons.arrow_back,
        onTap: () => Navigator.pop(context),
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
