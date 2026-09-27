import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_mobile_app/core/theming/app_color.dart';
import 'package:skeleton_mobile_app/core/widgets/dilaog_utils.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_peak_days_cubit.dart';
import 'package:skeleton_mobile_app/features/expeness/logic/expenses_peak_days_state.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/expenses_peak_days_shimmer.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/peak_spending_day.dart';
import 'package:skeleton_mobile_app/features/expeness/ui/widgets/peak_spending_days_card.dart';
import 'package:skeleton_mobile_app/l10n/app_localizations.dart';

class ExpensesPeakDaysSection extends StatelessWidget {
  const ExpensesPeakDaysSection({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dark = Theme.of(context).brightness == Brightness.dark;
    final palette = dark
        ? [
            AppColorsDark.error,
            AppColorsDark.warning,
            AppColorsDark.primary,
            AppColorsDark.accentPurple,
            AppColorsDark.textMuted,
          ]
        : [
            AppColorsLight.error,
            AppColorsLight.warning,
            AppColorsLight.primary,
            AppColorsLight.accentPurple,
            AppColorsLight.textMuted,
          ];
    return BlocConsumer<ExpensesPeakDaysCubit, ExpensesPeakDaysState>(
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
        loading: () => const ExpensesPeakDaysShimmer(),
        success: (data) {
          final max = data.items.fold<double>(
            0,
            (value, item) => item.total > value ? item.total : value,
          );
          return PeakSpendingDaysCard(
            days: [
              for (var i = 0; i < data.items.length; i++)
                PeakSpendingDay(
                  date: data.items[i].dayFormatted ?? data.items[i].day ?? '',
                  amount: data.items[i].total,
                  progress: max == 0 ? 0 : data.items[i].total / max,
                  gradientStart: palette[i % palette.length].withValues(
                    alpha: .6,
                  ),
                  gradientEnd: palette[i % palette.length],
                  amountColor: palette[i % palette.length],
                ),
            ],
          );
        },
        orElse: () => const ExpensesPeakDaysShimmer(),
      ),
    );
  }
}
