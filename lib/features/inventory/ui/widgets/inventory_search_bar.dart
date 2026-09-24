import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_product_cubit.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class InventorySearchBar extends StatefulWidget {
  const InventorySearchBar({super.key});

  @override
  State<InventorySearchBar> createState() => _InventorySearchBarState();
}

class _InventorySearchBarState extends State<InventorySearchBar> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _search(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (mounted) {
        context.read<InventoryProductCubit>().searchProducts(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return TextFormField(
      textInputAction: TextInputAction.search,
      onChanged: _search,
      onFieldSubmitted: (query) {
        _debounce?.cancel();
        context.read<InventoryProductCubit>().searchProducts(query);
      },
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
        suffixIcon: PopupMenuButton<String>(
          tooltip: Localizations.localeOf(context).languageCode == 'ar'
              ? 'تصفية'
              : 'Filter',
          icon: Icon(
            Icons.tune_rounded,
            size: 19.sp,
            color: theme.primaryColor,
          ),
          onSelected: (status) => context
              .read<InventoryProductCubit>()
              .filterByStatus(status == 'all' ? null : status),
          itemBuilder: (context) {
            final isArabic =
                Localizations.localeOf(context).languageCode == 'ar';
            return [
              PopupMenuItem(
                value: 'all',
                child: Text(isArabic ? 'كل الحالات' : 'All statuses'),
              ),
              PopupMenuItem(
                value: 'InStock',
                child: Text(isArabic ? 'متوفر' : 'In stock'),
              ),
              PopupMenuItem(
                value: 'LowStock',
                child: Text(isArabic ? 'مخزون منخفض' : 'Low stock'),
              ),
              PopupMenuItem(
                value: 'OutOfStock',
                child: Text(isArabic ? 'نفد المخزون' : 'Out of stock'),
              ),
            ];
          },
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
