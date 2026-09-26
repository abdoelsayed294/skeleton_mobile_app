import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';

class TotalSalesLoadingContent extends StatelessWidget {
  const TotalSalesLoadingContent({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ShimmerBlock(width: 155.w, height: 30.h),
      SizedBox(height: 8.h),
      ShimmerBlock(width: 130.w, height: 20.h, radius: 14),
    ],
  );
}
