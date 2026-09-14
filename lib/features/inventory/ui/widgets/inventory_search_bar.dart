import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class InventorySearchBar extends StatelessWidget {
  const InventorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return TextFormField(
      textInputAction: TextInputAction.search,
      style: TextStyle(
        color: theme.textTheme.bodyMedium?.color,
        fontSize: 12.sp,
      ),
      decoration: InputDecoration(
        hintText: l10n.searchProducts,
        hintStyle: TextStyle(
          color: theme.textTheme.bodySmall?.color,
          fontSize: 12.sp,
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          size: 21.sp,
          color: theme.primaryColor,
        ),
        suffixIcon: Icon(
          Icons.tune_rounded,
          size: 19.sp,
          color: theme.primaryColor,
        ),
        filled: true,
        fillColor: theme.cardColor,
        contentPadding: EdgeInsets.symmetric(vertical: 13.h),
        border: _border(theme.dividerColor),
        enabledBorder: _border(theme.dividerColor),
        focusedBorder: _border(theme.primaryColor),
      ),
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(color: color),
    );
  }
}
