import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/widgets/shimmer_block.dart';

class ExpensesPeakDaysShimmer extends StatelessWidget {
  const ExpensesPeakDaysShimmer({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(18.w),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerBlock(width: 145.w, height: 15.h),
        SizedBox(height: 18.h),
        for (var i = 0; i < 5; i++) ...[
          Row(
            children: [
              ShimmerBlock(width: 48.w, height: 10.h),
              SizedBox(width: 8.w),
              Expanded(
                child: ShimmerBlock(width: double.infinity, height: 7.h),
              ),
              SizedBox(width: 8.w),
              ShimmerBlock(width: 45.w, height: 11.h),
            ],
          ),
          if (i != 4) SizedBox(height: 13.h),
        ],
      ],
    ),
  );
}
