import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class InventoryCategoryFilterShimmer extends StatelessWidget {
  const InventoryCategoryFilterShimmer({super.key});

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
      child: SizedBox(
        height: 42.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          separatorBuilder: (_, _) => SizedBox(width: 9.w),
          itemBuilder: (context, index) {
            return Container(
              width: index == 0 ? 62.w : 85.w,
              height: 42.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.r),
              ),
            );
          },
        ),
      ),
    );
  }
}
