import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_stat_shimmer_card.dart';

class InventoryStatsShimmer extends StatelessWidget {
  const InventoryStatsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark
          ? Colors.grey.shade800
          : Colors.grey.shade300,
      highlightColor: isDark
          ? Colors.grey.shade700
          : Colors.grey.shade100,
      child: Row(
        children: List.generate(
          3,
          (index) => Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: index < 2 ? 10.w : 0,
              ),
              child: const InventoryStatShimmerCard(),
            ),
          ),
        ),
      ),
    );
  }
}
