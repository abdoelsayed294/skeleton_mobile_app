import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_mobile_app/core/theming/app_style.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_product_cubit.dart';
import 'package:skeleton_mobile_app/features/inventory/logic/inventory_state.dart';
import 'package:skeleton_mobile_app/features/inventory/ui/widgets/inventory_category_filter_shimmer.dart';
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

    return BlocConsumer<InventoryCubit, InventoryState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (error) {
            DialogUtils.showMessage(
              context: context,
              type: DialogType.error,
              title: l10n.errorTitle,
              message: error.error?.message ?? l10n.genericError,
            );
          },
          orElse: () {},
        );
      },

      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const InventoryCategoryFilterShimmer(),
          success: (data) {
            final categories = [
              l10n.allCategory,
              ...(data.itemTypes ?? []).whereType<String>(),
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
                    onTap: () {
                      setState(() => selectedIndex = index);
                      final itemType = index == 0 ? null : categories[index];
                      context.read<InventoryCubit>().getInventorySummary(
                        itemType: itemType,
                      );
                      context.read<InventoryProductCubit>().selectCategory(
                        itemType,
                      );
                    },
                    borderRadius: BorderRadius.circular(22.r),
                    child: Container(
                      constraints: BoxConstraints(minWidth: 62.w),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selected ? theme.primaryColor : theme.cardColor,
                        borderRadius: BorderRadius.circular(22.r),
                        border: Border.all(
                          color: selected
                              ? theme.primaryColor
                              : theme.dividerColor,
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
          },
        );
      },
    );
  }
}
