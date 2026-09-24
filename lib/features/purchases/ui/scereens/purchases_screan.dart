import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/add_purchase_button.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_header.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_list_section.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_summary_card.dart';

class PurchasesScrean extends StatefulWidget {
  const PurchasesScrean({super.key});

  @override
  State<PurchasesScrean> createState() => _PurchasesScreanState();
}

class _PurchasesScreanState extends State<PurchasesScrean> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const AddPurchaseButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 88.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PurchasesHeader(),
              SizedBox(height: 16.h),
              const PurchasesSummaryCard(),
              SizedBox(height: 24.h),
              PurchasesListSection(scrollController: _scrollController),
            ],
          ),
        ),
      ),
    );
  }
}
