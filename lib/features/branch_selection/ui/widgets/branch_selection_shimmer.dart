import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/branch_selection/ui/widgets/branch_selection_card_shimmer.dart';

class BranchSelectionShimmer extends StatelessWidget {
  const BranchSelectionShimmer({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      const BranchSelectionCardShimmer(),
      SizedBox(height: 10.h),
      const BranchSelectionCardShimmer(),
      SizedBox(height: 10.h),
      const BranchSelectionCardShimmer(),
    ],
  );
}
