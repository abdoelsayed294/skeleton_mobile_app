import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_shimmer_block.dart';

class ProfitSummaryShimmer extends StatelessWidget {
  const ProfitSummaryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    double w(double value) => isLandscape ? value : value.w;
    double h(double value) => isLandscape ? value : value.h;
    double r(double value) => isLandscape ? value : value.r;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
      highlightColor: isDark ? Colors.grey.shade700 : Colors.grey.shade100,
      child: Container(
        height: h(198),
        width: double.infinity,
        padding: EdgeInsets.all(w(18)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(r(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfitShimmerBlock(width: w(100), height: h(12)),
            SizedBox(height: h(16)),
            ProfitShimmerBlock(width: w(150), height: h(32)),
            const Spacer(),
            ProfitShimmerBlock(width: double.infinity, height: h(1)),
            SizedBox(height: h(16)),
            ProfitShimmerBlock(width: w(180), height: h(13)),
          ],
        ),
      ),
    );
  }
}
