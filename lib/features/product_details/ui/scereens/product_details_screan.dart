import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_activity_section.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_details_app_bar.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_edit_button.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_info_card.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_inventory_section.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_overview_section.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_pricing_section.dart';
import 'package:skeleton_mobile_app/features/product_details/ui/widgets/product_sales_history_card.dart';

class ProductDetailsScrean extends StatelessWidget {
  const ProductDetailsScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 8.h),
              child: const ProductDetailsAppBar(
                title: 'Wireless Earbuds Pro',
                sku: 'WEP-2024-BLK',
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20.w, 6.h, 20.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductOverviewSection(
                      name: 'Wireless Earbuds Pro',
                      subtitle: 'Noise-Cancelling True Wireless — Matte Black',
                      category: 'Electronics > Audio',
                      icon: Icons.headphones_rounded,
                      inStock: true,
                    ),
                    SizedBox(height: 16.h),
                    const ProductInfoCard(
                      sku: 'WEP-2024-BLK',
                      category: 'Electronics / Audio',
                      supplier: 'SoundTech Co., Ltd.',
                    ),
                    SizedBox(height: 20.h),
                    const ProductPricingSection(
                      purchasePrice: r'$42.00',
                      sellingPrice: r'$79.99',
                      profitPerUnit: r'$37.99',
                      profitMargin: '47.5',
                      marginChange: '8.2%',
                    ),
                    SizedBox(height: 20.h),
                    const ProductInventorySection(
                      currentStock: 148,
                      minimumStock: 20,
                      soldToday: 12,
                      soldThisWeek: 74,
                      soldThisMonth: 302,
                    ),
                    SizedBox(height: 20.h),
                    ProductSalesHistoryCard(
                      totalUnits: '74',
                      changePercent: '12.4%',
                      dayLabels: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                      dayValues: const [0.35, 0.42, 0.24, 0.55, 0.62, 0.78, 0.28],
                    ),
                    SizedBox(height: 20.h),
                    ProductActivitySection(
                      entries: [
                        ActivityEntry(
                          icon: Icons.sync_rounded,
                          color: const Color(0xFF059669),
                          title: 'Stock Added',
                          subtitle: '+50 units from SoundTech',
                          value: '+50',
                          time: 'Today, 9:14 AM',
                        ),
                        ActivityEntry(
                          icon: Icons.sell_outlined,
                          color: const Color(0xFFD97706),
                          title: 'Product Sold',
                          subtitle: '3 units · POS Terminal #2',
                          value: r'$239.97',
                          time: 'Today, 8:45 AM',
                        ),
                        ActivityEntry(
                          icon: Icons.local_shipping_outlined,
                          color: const Color(0xFF1E88E5),
                          title: 'Purchase Received',
                          subtitle: 'PO#4420 · 100 units',
                          value: '+100',
                          time: 'Yesterday',
                        ),
                        ActivityEntry(
                          icon: Icons.tune_rounded,
                          color: const Color(0xFFE11D48),
                          title: 'Stock Adjustment',
                          subtitle: 'Damaged goods write-off',
                          value: '-2',
                          time: 'Mon, Dec 11',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
              child: const ProductEditButton(),
            ),
          ],
        ),
      ),
    );
  }
}
