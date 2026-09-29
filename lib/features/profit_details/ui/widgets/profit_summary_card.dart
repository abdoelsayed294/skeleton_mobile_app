import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton/core/theming/app_color.dart';
import 'package:skeleton/core/theming/app_style.dart';
import 'package:skeleton/core/widgets/dilaog_utils.dart';
import 'package:skeleton/features/profit_details/logic/profit_summary_cubit.dart';
import 'package:skeleton/features/profit_details/logic/profit_summary_state.dart';
import 'package:skeleton/features/profit_details/ui/widgets/profit_summary_shimmer.dart';
import 'package:skeleton/l10n/app_localizations.dart';

class ProfitSummaryCard extends StatelessWidget {
  const ProfitSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<ProfitSummaryCubit, ProfitSummaryState>(
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
        orElse: () => const SizedBox.shrink(),
        loading: () => const ProfitSummaryShimmer(),
        success: (data) {
          final summary = data;
          final isDark = Theme.of(context).brightness == Brightness.dark;
          final isLandscape =
              MediaQuery.orientationOf(context) == Orientation.landscape;
          double w(double value) => isLandscape ? value : value.w;
          double h(double value) => isLandscape ? value : value.h;
          double r(double value) => isLandscape ? value : value.r;
          final isRtl = Directionality.of(context) == TextDirection.rtl;
          final gradientColors = isDark
              ? [
                  AppColorsDark.primaryGradientStart,
                  AppColorsDark.primaryGradientEnd,
                ]
              : [AppColorsLight.primaryGradientStart, AppColorsLight.primary];
          final metadataStyle = AppStyles.totalSalesCompareLight.copyWith(
            fontSize: 12,
          );

          return Container(
            height: h(198),
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(r(20)),
              boxShadow: [
                BoxShadow(
                  color: gradientColors.last.withValues(alpha: 0.3),
                  blurRadius: r(14),
                  offset: Offset(0, h(7)),
                ),
              ],
            ),
            child: Stack(
              children: [
                PositionedDirectional(
                  end: -w(38),
                  bottom: -h(48),
                  child: Container(
                    width: w(148),
                    height: w(148),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    w(18),
                    h(18),
                    w(16),
                    h(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.netProfit.toUpperCase(),
                        style: AppStyles.totalSalesLabelLight,
                      ),
                      SizedBox(height: h(5)),
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: w(76)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: isRtl
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text(
                                    (summary.netProfit?.value ?? 0)
                                        .toStringAsFixed(0),
                                    maxLines: 1,
                                    style: AppStyles.totalSalesAmountLight
                                        .copyWith(fontSize: 36),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: w(5)),
                            Text(
                              l10n.currencyEgp,
                              style: AppStyles.totalSalesUnitLight,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        ' · ',
                        style: metadataStyle,
                        textDirection: TextDirection.ltr,
                      ),
                      const Spacer(),
                      Container(
                        height: 1,
                        color: Colors.white.withValues(alpha: 0.16),
                      ),
                      SizedBox(height: h(14)),
                      Row(
                        children: [
                          Text(
                            '${summary.netProfit?.comparisonLabel ?? l10n.vsYesterday}: ',
                            style: metadataStyle,
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Text(
                              '${(summary.netProfit?.percentChange ?? 0) >= 0 ? '+' : ''}${(summary.netProfit?.percentChange ?? 0).toStringAsFixed(1)}%',
                              style: metadataStyle.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text('${l10n.margin}: ', style: metadataStyle),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Text(
                              '${(summary.margin?.value ?? 0).toStringAsFixed(1)}%',
                              style: metadataStyle.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PositionedDirectional(
                  top: h(22),
                  end: w(20),
                  child: Container(
                    width: w(52),
                    height: w(52),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(r(16)),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.24),
                      ),
                    ),
                    child: Text(
                      'S\$',
                      style: AppStyles.totalSalesStatValueLight.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: h(88),
                  end: w(20),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: w(10),
                      vertical: h(6),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(r(18)),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        '${(summary.netProfit?.percentChange ?? 0) >= 0 ? '+' : ''}${(summary.netProfit?.percentChange ?? 0).toStringAsFixed(1)}%',
                        style: AppStyles.totalSalesChangeLight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (_) => const SizedBox.shrink(),
      ),
    );
  }
}
