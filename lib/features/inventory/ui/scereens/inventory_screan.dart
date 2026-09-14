import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/spacing.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_header.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_product_list.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_search_bar.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_category_filter.dart';

class InventoryScrean extends StatelessWidget {
  const InventoryScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InventoryHeader(),
                InventorySearchBar(),
                verticalSpace(16.h),
                InventoryCategoryFilter(),
                verticalSpace(16.h),
                InventoryProductList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
