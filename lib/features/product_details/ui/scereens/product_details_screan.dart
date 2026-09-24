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
  final int productId;

  const ProductDetailsScrean({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ProductEditButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Edit Product - coming soon')),
          );
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 8.h),
              child: const ProductDetailsAppBar(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20.w, 6.h, 20.w, 90.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductOverviewSection(),
                    SizedBox(height: 16.h),
                    const ProductInfoCard(),
                    SizedBox(height: 20.h),
                    const ProductPricingSection(),
                    SizedBox(height: 20.h),
                    const ProductInventorySection(),
                    SizedBox(height: 20.h),
                    const ProductSalesHistoryCard(),
                    SizedBox(height: 20.h),
                    const ProductActivitySection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
