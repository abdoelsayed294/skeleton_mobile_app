import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchase_summary_metric.dart';

class PurchasesSummaryCard extends StatelessWidget {
  const PurchasesSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFE7F2FF)],
        ),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: const Color(0xFFD7E9FF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x121E88E5),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('TOTAL PURCHASES', style: AppStyles.statTitleLight),
              const Spacer(),
              Container(
                width: 34.w,
                height: 34.w,
                decoration: BoxDecoration(
                  color: const Color(0x221E88E5),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 18.sp,
                  color: AppColorsLight.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('EGP', style: AppStyles.font12MediumLight),
              SizedBox(width: 8.w),
              Text('32,450', style: AppStyles.font24BlackLight),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 14.sp,
                color: AppColorsLight.textMuted,
              ),
              SizedBox(width: 6.w),
              Text('This month', style: AppStyles.font12MediumLight),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: AppColorsLight.successBg,
                  border: Border.all(color: AppColorsLight.successBorder),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Text(
                  '+ 12.4% vs last month',
                  style: AppStyles.statChangeLight,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: const [
              Expanded(
                child: PurchaseSummaryMetric(
                  title: 'ORDERS',
                  value: '48',
                  subtitle: 'Purchases',
                  icon: Icons.receipt_long_outlined,
                  color: AppColorsLight.warning,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: PurchaseSummaryMetric(
                  title: 'SOURCES',
                  value: '12',
                  subtitle: 'Suppliers',
                  icon: Icons.inventory_2_outlined,
                  color: AppColorsLight.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
