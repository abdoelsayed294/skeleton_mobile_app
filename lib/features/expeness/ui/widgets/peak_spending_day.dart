import 'package:flutter/material.dart';

/// Represents one row inside the "Peak Spending Days" card.
class PeakSpendingDay {
  const PeakSpendingDay({
    required this.date,
    required this.amount,
    required this.progress,
    required this.gradientStart,
    required this.gradientEnd,
    required this.amountColor,
  });

  final String date;
  final double amount;

  /// 0.0 -> 1.0, how full the bar should be relative to the highest day.
  final double progress;
  final Color gradientStart;
  final Color gradientEnd;
  final Color amountColor;
}
