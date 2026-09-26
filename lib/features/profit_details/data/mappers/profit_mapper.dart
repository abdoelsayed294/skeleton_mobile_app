import 'package:skeleton_mobile_app/features/profit_details/data/model/profit_summary_dto.dart';
import 'package:skeleton_mobile_app/features/profit_details/data/model/profit_weekly_chart_dto.dart';
import 'package:skeleton_mobile_app/features/profit_details/domain/entity/profit_summary.dart';
import 'package:skeleton_mobile_app/features/profit_details/domain/entity/profit_weekly_chart.dart';

extension ProfitSummaryDtoMapper on ProfitSummaryDto {
  ProfitSummary toEntity() => ProfitSummary(
    period: period,
    range: range == null ? null : ProfitRange(from: range!.from, to: range!.to),
    netProfit: netProfit?.toEntity(),
    grossProfit: grossProfit?.toEntity(),
    margin: margin?.toEntity(),
    revenue: revenue?.toEntity(),
    revenuePaid: revenuePaid?.toEntity(),
    expenses: expenses?.toEntity(),
    cogs: cogs ?? 0,
    returnedLoss: returnedLoss ?? 0,
    damagedPaid: damagedPaid ?? 0,
    paymentBreakdown: profitBreakdownByPayment == null
        ? null
        : ProfitPaymentBreakdown(
            cash: profitBreakdownByPayment!.cash ?? 0,
            collectedCredit: profitBreakdownByPayment!.collectedCredit ?? 0,
            pendingCredit: profitBreakdownByPayment!.pendingCredit ?? 0,
          ),
    expenseBreakdown:
        expenseBreakdown
            ?.map(
              (e) => ProfitExpenseBreakdown(
                category: e.category,
                total: e.total ?? 0,
                percent: e.percent ?? 0,
              ),
            )
            .toList() ??
        const [],
  );
}

extension ProfitMetricDtoMapper on ProfitMetricDto {
  ProfitMetric toEntity() => ProfitMetric(
    value: value ?? 0,
    comparisonLabel: comparisonLabel,
    percentChange: percentChange ?? 0,
  );
}

extension ProfitWeeklyChartDtoMapper on ProfitWeeklyChartDto {
  ProfitWeeklyChart toEntity() => ProfitWeeklyChart(
    range: range == null
        ? null
        : ProfitChartRange(from: range!.from, to: range!.to),
    weekTotal: weekTotal ?? 0,
    days:
        weeklyProfitSummary
            ?.map(
              (e) => ProfitWeeklyDay(
                date: e.date,
                revenue: e.revenue ?? 0,
                netProfit: e.netProfit ?? 0,
                gross: e.gross ?? 0,
                cogs: e.cogs ?? 0,
                expenses: e.expenses ?? 0,
              ),
            )
            .toList() ??
        const [],
  );
}
