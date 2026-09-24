import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchase_shimmer_block.dart';

class PurchasesListShimmer extends StatelessWidget {
  const PurchasesListShimmer({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Column(
      children: List.generate(
        3,
        (_) => Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Container(
            height: 108.h,
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PurchaseShimmerBlock(width: 160.w, height: 14.h),
                SizedBox(height: 12.h),
                PurchaseShimmerBlock(width: 110.w, height: 10.h),
                const Spacer(),
                PurchaseShimmerBlock(width: 210.w, height: 12.h),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
