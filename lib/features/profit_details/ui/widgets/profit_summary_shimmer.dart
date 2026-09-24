import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_shimmer_block.dart';

class ProfitSummaryShimmer extends StatelessWidget {
  const ProfitSummaryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
      highlightColor: isDark ? Colors.grey.shade700 : Colors.grey.shade100,
      child: Container(
        height: 198.h,
        width: double.infinity,
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfitShimmerBlock(width: 100.w, height: 12.h),
            SizedBox(height: 16.h),
            ProfitShimmerBlock(width: 150.w, height: 32.h),
            const Spacer(),
            ProfitShimmerBlock(width: double.infinity, height: 1.h),
            SizedBox(height: 16.h),
            ProfitShimmerBlock(width: 180.w, height: 13.h),
          ],
        ),
      ),
    );
  }
}
