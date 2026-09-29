import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeleton/features/profit_details/ui/widgets/profit_shimmer_block.dart';

class ProfitMetricShimmer extends StatelessWidget {
  const ProfitMetricShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    double w(double size) => isLandscape ? size : size.w;
    double h(double size) => isLandscape ? size : size.h;
    double r(double size) => isLandscape ? size : size.r;

    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey.shade800
            : Colors.grey.shade300,
        highlightColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey.shade700
            : Colors.grey.shade100,
        child: Container(
          height: h(112),
          padding: EdgeInsets.all(w(12)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(r(14)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfitShimmerBlock(width: w(84), height: h(11)),
              SizedBox(height: h(14)),
              ProfitShimmerBlock(width: w(60), height: h(20)),
              const Spacer(),
              ProfitShimmerBlock(width: w(52), height: h(16)),
            ],
          ),
        ),
      ),
    );
  }
}
