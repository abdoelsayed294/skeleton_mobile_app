import 'package:flutter/material.dart';
import 'package:skeleton/core/theming/app_style.dart';

class EmptyStateMessage extends StatelessWidget {
  final String message;

  const EmptyStateMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: isDark
            ? AppStyles.font14MediumDark
            : AppStyles.font14MediumLight,
      ),
    );
  }
}
