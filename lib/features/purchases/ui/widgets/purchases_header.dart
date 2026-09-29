import 'package:flutter/material.dart';
import 'package:skeleton/features/profit_details/ui/widgets/profit_details_header.dart';
import 'package:skeleton/l10n/app_localizations.dart';

class PurchasesHeader extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  const PurchasesHeader({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) => ProfitDetailsHeader(
    title: AppLocalizations.of(context)!.purchases,
    selectedDate: selectedDate,
    onDateChanged: onDateChanged,
    onBack: () => Navigator.of(context).pop(),
  );
}
