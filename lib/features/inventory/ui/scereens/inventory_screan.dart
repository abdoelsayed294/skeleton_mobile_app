import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/helpers/spacing.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_header.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_product_list.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_search_bar.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_category_filter.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_stats.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class InventoryScrean extends StatefulWidget {
  const InventoryScrean({super.key});

  @override
  State<InventoryScrean> createState() => _InventoryScreanState();
}

class _InventoryScreanState extends State<InventoryScrean> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
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
                  InventoryStats(l10n: l10n),
                  verticalSpace(22.h),
                InventoryProductList(scrollController: _scrollController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
