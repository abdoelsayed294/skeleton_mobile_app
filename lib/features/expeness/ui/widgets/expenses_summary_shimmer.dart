import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';

class ExpensesSummaryShimmer extends StatelessWidget {
  const ExpensesSummaryShimmer({super.key});
  @override
  Widget build(BuildContext context) => Container(
    height: 205.h,
    width: double.infinity,
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(22.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerBlock(width: 145.w, height: 13.h),
        SizedBox(height: 17.h),
        ShimmerBlock(width: 160.w, height: 34.h),
        const Spacer(),
        ShimmerBlock(width: double.infinity, height: 1.h),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerBlock(width: 68.w, height: 25.h),
            ShimmerBlock(width: 68.w, height: 25.h),
            ShimmerBlock(width: 68.w, height: 25.h),
          ],
        ),
      ],
    ),
  );
}
