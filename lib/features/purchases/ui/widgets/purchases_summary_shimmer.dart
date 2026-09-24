import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchase_shimmer_block.dart';

class PurchasesSummaryShimmer extends StatelessWidget {
  const PurchasesSummaryShimmer({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: Container(
      height: 250.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PurchaseShimmerBlock(width: 140.w, height: 16.h),
          SizedBox(height: 22.h),
          PurchaseShimmerBlock(width: 170.w, height: 30.h),
          SizedBox(height: 20.h),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: PurchaseShimmerBlock(
                  width: double.infinity,
                  height: 74.h,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: PurchaseShimmerBlock(
                  width: double.infinity,
                  height: 74.h,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
