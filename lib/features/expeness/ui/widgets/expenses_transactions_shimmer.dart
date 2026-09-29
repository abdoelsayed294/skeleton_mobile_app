import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/widgets/shimmer_block.dart';

class ExpensesTransactionsShimmer extends StatelessWidget {
  const ExpensesTransactionsShimmer({super.key});
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
        ShimmerBlock(width: 150.w, height: 15.h),
        SizedBox(height: 16.h),
        for (var i = 0; i < 4; i++) ...[
          Row(
            children: [
              ShimmerBlock(width: 38.w, height: 38.w),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBlock(width: 105.w, height: 11.h),
                    SizedBox(height: 6.h),
                    ShimmerBlock(width: 70.w, height: 9.h),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              ShimmerBlock(width: 50.w, height: 13.h),
            ],
          ),
          if (i != 3)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 11.h),
              child: ShimmerBlock(width: double.infinity, height: 1.h),
            ),
        ],
      ],
    ),
  );
}
