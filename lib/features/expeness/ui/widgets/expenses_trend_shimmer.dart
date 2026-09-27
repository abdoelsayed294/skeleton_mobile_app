import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';

class ExpensesTrendShimmer extends StatelessWidget {
  const ExpensesTrendShimmer({super.key});
  @override
  Widget build(BuildContext context) => Container(
    height: 235.h,
    padding: EdgeInsets.all(18.w),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerBlock(width: 140.w, height: 15.h),
        SizedBox(height: 8.h),
        ShimmerBlock(width: 110.w, height: 10.h),
        const Spacer(),
        ShimmerBlock(width: double.infinity, height: 110.h),
        SizedBox(height: 12.h),
        ShimmerBlock(width: double.infinity, height: 10.h),
      ],
    ),
  );
}
