import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_product_tile_shimmer.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_shimmer_placeholder.dart';

class InventoryProductListShimmer extends StatelessWidget {
  const InventoryProductListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
      highlightColor: isDark ? Colors.grey.shade700 : Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InventoryShimmerPlaceholder(
                width: 96.w,
                height: 16.h,
                radius: 5.r,
              ),
              SizedBox(width: 8.w),
              InventoryShimmerPlaceholder(
                width: 24.w,
                height: 14.h,
                radius: 5.r,
              ),
              const Spacer(),
              InventoryShimmerPlaceholder(
                width: 50.w,
                height: 14.h,
                radius: 5.r,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          ...List.generate(
            4,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: index == 3 ? 0 : 12.h),
              child: const InventoryProductTileShimmer(),
            ),
          ),
        ],
      ),
    );
  }
}

