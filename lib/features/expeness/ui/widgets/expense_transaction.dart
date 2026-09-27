import 'package:flutter/material.dart';

/// Represents one row inside the "All Transactions" card.
class ExpenseTransaction {
  const ExpenseTransaction({
    required this.avatarLabel,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.avatarBg,
    required this.avatarColor,
  });

  final String avatarLabel;
  final String title;
  final String subtitle;
  final double amount;
  final Color avatarBg;
  final Color avatarColor;
}
