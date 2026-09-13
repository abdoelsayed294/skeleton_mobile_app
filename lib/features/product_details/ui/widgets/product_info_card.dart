import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/section_card.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/info_row.dart';

class ProductInfoCard extends StatelessWidget {
  final String sku;
  final String category;
  final String supplier;

  const ProductInfoCard({
    super.key,
    required this.sku,
    required this.category,
    required this.supplier,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: Column(
          children: [
            InfoRow(icon: Icons.qr_code_2_rounded, label: 'SKU / Barcode', value: sku),
            InfoRow(icon: Icons.grid_view_rounded, label: 'Category', value: category),
            InfoRow(
              icon: Icons.store_outlined,
              label: 'Supplier',
              value: supplier,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}

