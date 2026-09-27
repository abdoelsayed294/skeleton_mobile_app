import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseStatDivider extends StatelessWidget {
  const ExpenseStatDivider({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: 1,
    height: 39.h,
    color: Colors.white.withValues(alpha: 0.2),
  );
}
