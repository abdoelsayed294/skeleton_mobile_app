import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';

class RecentTransactionsShimmerList extends StatelessWidget {
  final ScrollController scrollController;

  const RecentTransactionsShimmerList({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) => ListView.separated(
    controller: scrollController,
    physics: const AlwaysScrollableScrollPhysics(),
    padding: EdgeInsets.all(16.w),
    itemCount: 10,
    separatorBuilder: (context, index) => SizedBox(height: 14.h),
    itemBuilder: (context, index) => Row(
      children: [
        ShimmerBlock(width: 38.w, height: 38.h, radius: 20),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerBlock(width: 110.w, height: 12.h),
              SizedBox(height: 7.h),
              ShimmerBlock(width: 75.w, height: 9.h),
            ],
          ),
        ),
        ShimmerBlock(width: 58.w, height: 13.h),
      ],
    ),
  );
}
