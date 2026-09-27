import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_details_header.dart';
import 'package:skeleton_mobile_app/features/purchases/ui/widgets/purchases_list_section.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class PurchasesRecentTransactionsScreen extends StatefulWidget {
  const PurchasesRecentTransactionsScreen({super.key});

  @override
  State<PurchasesRecentTransactionsScreen> createState() =>
      _PurchasesRecentTransactionsScreenState();
}

class _PurchasesRecentTransactionsScreenState
    extends State<PurchasesRecentTransactionsScreen> {
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 8.h),
              child: ProfitDetailsHeader(
                title: l10n.recentPurchases,
                onBack: () => Navigator.of(context).maybePop(),
                showDateSelector: false,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
                child: PurchasesListSection(
                  scrollController: _scrollController,
                  showSeeAll: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
