import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/home/ui/widgets/profit_details_header.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/add_purchase_button.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_list_section.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_summary_card.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class PurchasesScrean extends StatefulWidget {
  const PurchasesScrean({super.key});

  @override
  State<PurchasesScrean> createState() => _PurchasesScreanState();
}

class _PurchasesScreanState extends State<PurchasesScrean> {
  DateTime selectedDate = DateTime(2025, 1, 15);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const AddPurchaseButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 88.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfitDetailsHeader(
                title: l10n.purchases,
                selectedDate: selectedDate,
                onDateChanged: (date) {
                  setState(() => selectedDate = date);
                },
                onBack: () => Navigator.of(context).pop(),
              ),
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
