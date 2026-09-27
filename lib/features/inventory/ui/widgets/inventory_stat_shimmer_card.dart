import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InventoryStatShimmerCard extends StatelessWidget {
  const InventoryStatShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final landscape =
        MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
    return Container(
      height: landscape ? 108 : 108.h,
      padding: EdgeInsets.symmetric(vertical: landscape ? 13 : 13.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: landscape ? 33 : 33.w,
            height: landscape ? 33 : 33.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9.r),
            ),
          ),

          Container(
            width: landscape ? 40 : 40.w,
            height: landscape ? 18 : 18.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),

          Container(
            width: landscape ? 55 : 55.w,
            height: landscape ? 10 : 10.h,
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
