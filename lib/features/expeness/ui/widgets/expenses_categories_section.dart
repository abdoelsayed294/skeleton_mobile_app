import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_by_category_cubit.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_by_category_state.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expense_category.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expense_category_breakdown_card.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_categories_shimmer.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ExpensesCategoriesSection extends StatelessWidget {
  const ExpensesCategoriesSection({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dark = Theme.of(context).brightness == Brightness.dark;
    final colors = dark
        ? [
            AppColorsDark.primary,
            AppColorsDark.warning,
            AppColorsDark.error,
            AppColorsDark.accentPurple,
          ]
        : [
            AppColorsLight.primary,
            AppColorsLight.warning,
            AppColorsLight.error,
            AppColorsLight.accentPurple,
          ];
    return BlocConsumer<ExpensesByCategoryCubit, ExpensesByCategoryState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (error) => DialogUtils.showMessage(
            context: context,
            type: DialogType.error,
            title: l10n.errorTitle,
            message: error.error?.message ?? l10n.genericError,
          ),
          orElse: () {},
        );
      },
      builder: (context, state) => state.maybeWhen(
        loading: () => const ExpensesCategoriesShimmer(),
        success: (data) => ExpenseCategoryBreakdownCard(
          categories: [
            for (var i = 0; i < data.categories.length; i++)
              ExpenseCategory(
                title: data.categories[i].category ?? l10n.categoryOther,
                subtitle:
                    '${data.categories[i].transactions} ${l10n.transactions}',
                amount: data.categories[i].total,
                percent: data.categories[i].percent.round(),
                icon: Icons.category_rounded,
                iconBg: colors[i % colors.length].withValues(alpha: .12),
                barGradientStart: colors[i % colors.length].withValues(
                  alpha: .65,
                ),
                barGradientEnd: colors[i % colors.length],
                amountColor: colors[i % colors.length],
              ),
          ],
        ),
        orElse: () => const ExpensesCategoriesShimmer(),
      ),
    );
  }
}
