import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchase_record_card.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_count_badge.dart';

class PurchasesListSection extends StatelessWidget {
  const PurchasesListSection({super.key});

  @override
  Widget build(BuildContext context) {
    const records = [
      PurchaseRecord(
        name: 'Fresh Market Supplier',
        date: 'Nov 18, 2024',
        invoice: '#INV-1048',
        items: '24 Items',
        amount: '4,250',
        status: 'PAID',
        initials: 'FM',
        color: Color(0xFF2DD4BF),
      ),
      PurchaseRecord(
        name: 'Al-Ghazal Trading Co.',
        date: 'Nov 16, 2024',
        invoice: '#INV-1045',
        items: '36 Items',
        amount: '7,800',
        status: 'PARTIAL',
        initials: 'AG',
        color: AppColorsLight.warningAlt,
        remaining: 'EGP 3,200 remaining',
      ),
      PurchaseRecord(
        name: 'Nile Foods Distribution',
        date: 'Nov 14, 2024',
        invoice: '#INV-1041',
        items: '18 Items',
        amount: '5,600',
        status: 'PAID',
        initials: 'NF',
        color: Color(0xFF38BDF8),
      ),
      PurchaseRecord(
        name: 'Delta Express Wholesale',
        date: 'Nov 12, 2024',
        invoice: '#INV-1039',
        items: '52 Items',
        amount: '9,100',
        status: 'PENDING',
        initials: 'DE',
        color: AppColorsLight.errorAlt,
        due: 'Due Nov 20',
      ),
      PurchaseRecord(
        name: 'Kareem General Imports',
        date: 'Nov 10, 2024',
        invoice: '#INV-1034',
        items: '11 Items',
        amount: '2,350',
        status: 'PAID',
        initials: 'KG',
        color: AppColorsLight.primary,
      ),
      PurchaseRecord(
        name: 'MedPharma Supplies',
        date: 'Nov 08, 2024',
        invoice: '#INV-1029',
        items: '29 Items',
        amount: '3,350',
        status: 'PARTIAL',
        initials: 'MP',
        color: AppColorsLight.warningAlt,
        remaining: 'EGP 1,100 remaining',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('RECENT PURCHASES', style: AppStyles.statTitleLight),
            SizedBox(width: 8.w),
            const PurchasesCountBadge(),
            const Spacer(),
            Text(
              'See all',
              style: AppStyles.font12MediumLight.copyWith(
                color: AppColorsLight.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        ...records.map(
          (record) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: PurchaseRecordCard(record: record),
          ),
        ),
      ],
    );
  }
}
