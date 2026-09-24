import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/widgets/shimmer_block.dart';

class ProductDetailsSectionShimmer extends StatelessWidget {
  final double height;

  const ProductDetailsSectionShimmer({super.key, required this.height});

  @override
  Widget build(BuildContext context) =>
      ShimmerBlock(width: double.infinity, height: height.h, radius: 16);
}
