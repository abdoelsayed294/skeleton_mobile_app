import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';

class BranchSelectionCardShimmer extends StatelessWidget {
  const BranchSelectionCardShimmer({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 82.h,
    padding: EdgeInsets.symmetric(horizontal: 14.w),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: Theme.of(context).dividerColor),
    ),
    child: Row(
      children: [
        ShimmerBlock(width: 44.w, height: 44.w, radius: 12),
        SizedBox(width: 13.w),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerBlock(width: 150.w, height: 14.h),
              SizedBox(height: 9.h),
              ShimmerBlock(width: 72.w, height: 10.h),
            ],
          ),
        ),
        ShimmerBlock(width: 16.w, height: 16.w, radius: 20),
      ],
    ),
  );
}
