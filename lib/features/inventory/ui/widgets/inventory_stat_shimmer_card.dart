import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InventoryStatShimmerCard extends StatelessWidget {
  const InventoryStatShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.h,
      padding: EdgeInsets.symmetric(vertical: 13.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 33.w,
            height: 33.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9.r),
            ),
          ),

          Container(
            width: 40.w,
            height: 18.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),

          Container(
            width: 55.w,
            height: 10.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ],
      ),
    );
  }
}
