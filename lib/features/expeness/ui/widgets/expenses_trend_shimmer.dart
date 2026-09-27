import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';

class ExpensesTrendShimmer extends StatelessWidget {
  const ExpensesTrendShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    final landscape =
        MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height;
    double horizontal(double value) => landscape ? value : value.w;
    double vertical(double value) => landscape ? value : value.h;
    return Container(
      height: vertical(235),
      padding: EdgeInsets.all(horizontal(18)),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBlock(width: horizontal(140), height: vertical(15)),
          SizedBox(height: vertical(8)),
          ShimmerBlock(width: horizontal(110), height: vertical(10)),
          const Spacer(),
          ShimmerBlock(width: double.infinity, height: vertical(110)),
          SizedBox(height: vertical(12)),
          ShimmerBlock(width: double.infinity, height: vertical(10)),
        ],
      ),
    );
  }
}
