import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class InventoryCategoryFilter extends StatefulWidget {
  const InventoryCategoryFilter({super.key});

  @override
  State<InventoryCategoryFilter> createState() =>
      _InventoryCategoryFilterState();
}

class _InventoryCategoryFilterState extends State<InventoryCategoryFilter> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    final categories = [
      l10n.allCategory,
      l10n.drinksCategory,
      l10n.foodCategory,
      l10n.snacksCategory,
      l10n.householdCategory,
    ];

    return SizedBox(
      height: 42.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (_, _) => SizedBox(width: 9.w),
        itemBuilder: (context, index) {
          final selected = selectedIndex == index;
          return InkWell(
            onTap: () => setState(() => selectedIndex = index),
            borderRadius: BorderRadius.circular(22.r),
            child: Container(
              constraints: BoxConstraints(minWidth: 62.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? theme.primaryColor : theme.cardColor,
                borderRadius: BorderRadius.circular(22.r),
                border: Border.all(
                  color: selected ? theme.primaryColor : theme.dividerColor,
                ),
                boxShadow: selected
                    ? null
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.035),
                          blurRadius: 6.r,
                          offset: Offset(0, 2.h),
                        ),
                      ],
              ),
              child: Text(
                categories[index],
                style:
                    (isDark
                            ? AppStyles.font12MediumDark
                            : AppStyles.font12MediumLight)
                        .copyWith(
                          color: selected ? Colors.white : null,
                          fontWeight: selected
                              ? FontWeight.w700
                              : FontWeight.w500,
                        ),
              ),
            ),
          );
        },
      ),
    );
  }
}
