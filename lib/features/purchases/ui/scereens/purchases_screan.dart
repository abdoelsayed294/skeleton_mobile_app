import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_date_cubit.dart';
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
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: context.read<PurchasesDateCubit>().refresh,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<PurchasesDateCubit, DateTime>(
                  builder: (context, selectedDate) => PurchasesHeader(
                    selectedDate: selectedDate,
                    onDateChanged: context
                        .read<PurchasesDateCubit>()
                        .selectDate,
                  ),
                ),
                SizedBox(height: 16.h),
                const PurchasesSummaryCard(),
                SizedBox(height: 24.h),
                PurchasesListSection(scrollController: _scrollController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
