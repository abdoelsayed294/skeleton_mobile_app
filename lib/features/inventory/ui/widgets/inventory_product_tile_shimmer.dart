import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_shimmer_placeholder.dart';

class InventoryProductTileShimmer extends StatelessWidget {
  const InventoryProductTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              InventoryShimmerPlaceholder(
                width: 64.w,
                height: 64.w,
                radius: 12.r,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InventoryShimmerPlaceholder(
                      width: 120.w,
                      height: 15.h,
                      radius: 5.r,
                    ),
                    SizedBox(height: 7.h),
                    InventoryShimmerPlaceholder(
                      width: 76.w,
                      height: 12.h,
                      radius: 4.r,
                    ),
                  ],
                ),
              ),
              InventoryShimmerPlaceholder(
                width: 58.w,
                height: 24.h,
                radius: 12.r,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          InventoryShimmerPlaceholder(
            width: double.infinity,
            height: 6.h,
            radius: 8.r,
          ),
          SizedBox(height: 9.h),
          Row(
            children: [
              InventoryShimmerPlaceholder(
                width: 108.w,
                height: 12.h,
                radius: 4.r,
              ),
              const Spacer(),
              InventoryShimmerPlaceholder(
                width: 55.w,
                height: 15.h,
                radius: 5.r,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
