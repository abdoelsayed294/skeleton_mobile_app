import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_shimmer_block.dart';

class ProfitSectionShimmer extends StatelessWidget {
  final double height;
  const ProfitSectionShimmer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
      highlightColor: isDark ? Colors.grey.shade700 : Colors.grey.shade100,
      child: Container(
        height: height,
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfitShimmerBlock(width: 150.w, height: 15.h),
            SizedBox(height: 10.h),
            ProfitShimmerBlock(width: 100.w, height: 10.h),
            const Spacer(),
            ProfitShimmerBlock(width: double.infinity, height: height * 0.45),
            SizedBox(height: 12.h),
            ProfitShimmerBlock(width: 120.w, height: 12.h),
          ],
        ),
      ),
    );
  }
}
