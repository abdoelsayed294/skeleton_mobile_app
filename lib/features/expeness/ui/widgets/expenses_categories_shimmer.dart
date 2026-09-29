import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/widgets/shimmer_block.dart';

class ExpensesCategoriesShimmer extends StatelessWidget {
  const ExpensesCategoriesShimmer({super.key});
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
        ShimmerBlock(width: 130.w, height: 15.h),
        SizedBox(height: 16.h),
        for (var i = 0; i < 3; i++) ...[
          Row(
            children: [
              ShimmerBlock(width: 36.w, height: 36.w),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBlock(width: 100.w, height: 11.h),
                    SizedBox(height: 7.h),
                    ShimmerBlock(width: double.infinity, height: 5.h),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              ShimmerBlock(width: 45.w, height: 13.h),
            ],
          ),
          if (i != 2) SizedBox(height: 16.h),
        ],
      ],
    ),
  );
}
