import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/add_purchase_button.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_app_bar.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_list_section.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_summary_card.dart';

class PurchasesScrean extends StatelessWidget {
  const PurchasesScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const AddPurchaseButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 88.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PurchasesAppBar(),
              SizedBox(height: 16.h),
              const PurchasesSummaryCard(),
              SizedBox(height: 24.h),
              const PurchasesListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
