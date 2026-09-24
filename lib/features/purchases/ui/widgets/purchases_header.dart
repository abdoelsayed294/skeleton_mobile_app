import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/features/profit_details/ui/widgets/profit_details_header.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_recent_cubit.dart';
import 'package:skeleton_mobile_app/features/purchases/logic/purchases_summary_cubit.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class PurchasesHeader extends StatelessWidget {
  const PurchasesHeader({super.key});

  @override
  Widget build(BuildContext context) => ProfitDetailsHeader(
    title: AppLocalizations.of(context)!.purchases,
    selectedDate: context.watch<PurchasesSummaryCubit>().selectedDate,
    onDateChanged: (date) {
      context.read<PurchasesSummaryCubit>().selectDate(date);
      context.read<PurchasesRecentCubit>().getPurchasesRecent(
        date.year,
        date.month,
      );
    },
    onBack: () => Navigator.of(context).pop(),
  );
}
