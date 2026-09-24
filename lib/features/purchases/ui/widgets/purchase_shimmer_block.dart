import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchaseShimmerBlock extends StatelessWidget {
  final double width;
  final double height;

  const PurchaseShimmerBlock({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6.r),
    ),
  );
}
