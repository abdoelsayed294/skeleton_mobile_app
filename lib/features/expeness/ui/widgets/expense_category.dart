import 'package:flutter/material.dart';

/// Represents one row inside the "By Category" breakdown card.
class ExpenseCategory {
  const ExpenseCategory({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.percent,
    required this.icon,
    required this.iconBg,
    required this.barGradientStart,
    required this.barGradientEnd,
    required this.amountColor,
  });

  final String title;
  final String subtitle;
  final double amount;
  final int percent;
  final IconData icon;
  final Color iconBg;
  final Color barGradientStart;
  final Color barGradientEnd;
  final Color amountColor;
}
