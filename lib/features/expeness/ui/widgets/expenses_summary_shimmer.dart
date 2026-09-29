import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/widgets/shimmer_block.dart';

class ExpensesSummaryShimmer extends StatelessWidget {
  const ExpensesSummaryShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    final landscape =
        MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
    double horizontal(double value) => landscape ? value : value.w;
    double vertical(double value) => landscape ? value : value.h;
    return Container(
      height: vertical(205),
      width: double.infinity,
      padding: EdgeInsets.all(horizontal(20)),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBlock(width: horizontal(145), height: vertical(13)),
          SizedBox(height: vertical(17)),
          ShimmerBlock(width: horizontal(160), height: vertical(34)),
          const Spacer(),
          ShimmerBlock(width: double.infinity, height: vertical(1)),
          SizedBox(height: vertical(16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerBlock(width: horizontal(68), height: vertical(25)),
              ShimmerBlock(width: horizontal(68), height: vertical(25)),
              ShimmerBlock(width: horizontal(68), height: vertical(25)),
            ],
          ),
        ],
      ),
    );
  }
}
