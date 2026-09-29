import 'package:flutter/material.dart';
import 'package:skeleton/core/theming/app_style.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool isDark;

  const SectionHeader({super.key, required this.title, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final titleStyle = isDark
        ? AppStyles.productTitleDark
        : AppStyles.productTitleLight;
    return Row(
      children: [Expanded(child: Text(title.toUpperCase(), style: titleStyle))],
    );
  }
}
