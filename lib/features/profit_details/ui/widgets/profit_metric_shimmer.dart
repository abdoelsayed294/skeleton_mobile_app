import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_shimmer_block.dart';

class ProfitMetricShimmer extends StatelessWidget {
  const ProfitMetricShimmer({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
    child: Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey.shade800
          : Colors.grey.shade300,
      highlightColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey.shade700
          : Colors.grey.shade100,
      child: Container(
        height: 112.h,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfitShimmerBlock(width: 84.w, height: 11.h),
            SizedBox(height: 14.h),
            ProfitShimmerBlock(width: 60.w, height: 20.h),
            const Spacer(),
            ProfitShimmerBlock(width: 52.w, height: 16.h),
          ],
        ),
      ),
    ),
  );
}
