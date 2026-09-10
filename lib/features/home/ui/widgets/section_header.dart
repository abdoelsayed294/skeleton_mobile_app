import 'package:flutter/material.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String action;
  final bool isDark;

  const SectionHeader({
    super.key,
    required this.title,
    required this.action,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = isDark
        ? AppStyles.productTitleDark
        : AppStyles.productTitleLight;
    final actionStyle = isDark
        ? AppStyles.productSubtitleDark
        : AppStyles.productSubtitleLight;

    return Row(
      children: [
        Expanded(child: Text(title.toUpperCase(), style: titleStyle)),
        Text(
          action,
          style: actionStyle.copyWith(color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}
