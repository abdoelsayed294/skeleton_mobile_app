import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_by_category_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_monthly_trend_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_peak_days_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_summary_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/data/model/expenses_transactions_dto.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_by_category.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_monthly_trend.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_peak_days.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_summary.dart';
import 'package:skeleton_mobile_app/features/expeness/domain/entity/expenses_transactions.dart';

extension ExpensesSummaryMapper on ExpensesSummaryDto {
  ExpensesSummary toEntity() => ExpensesSummary(
    storeId: storeId,
    period: period,
    periodLabel: periodLabel,
    currency: currency,
    range: range == null
        ? null
        : ExpenseDateRange(from: range!.from, to: range!.to),
    totalExpenses: totalExpenses?.toDouble() ?? 0,
    pct: pct?.toDouble() ?? 0,
    vsLabel: vsLabel,
    vsTotal: vsTotal?.toDouble() ?? 0,
    transactions: transactions ?? 0,
    avgPerTx: avgPerTx?.toDouble() ?? 0,
    dailyAvg: dailyAvg?.toDouble() ?? 0,
    highest: highest?.toEntity(),
    lowest: lowest?.toEntity(),
  );
}

extension ExpenseSummaryEntryMapper on ExpenseSummaryEntryDto {
  ExpenseSummaryEntry toEntity() => ExpenseSummaryEntry(
    id: id,
    value: value?.toDouble() ?? 0,
    type: type,
    statement: statement,
    day: day,
    dayFormatted: dayFormatted,
  );
}

extension ExpensesMonthlyTrendMapper on ExpensesMonthlyTrendDto {
  ExpensesMonthlyTrend toEntity() => ExpensesMonthlyTrend(
    storeId: storeId,
    year: year,
    currency: currency,
    total: total?.toDouble() ?? 0,
    chart: chart?.map((item) => item.toEntity()).toList() ?? const [],
  );
}

extension ExpensesMonthlyTrendItemMapper on ExpensesMonthlyTrendItemDto {
  ExpensesMonthlyTrendItem toEntity() => ExpensesMonthlyTrendItem(
    label: label,
    month: month,
    from: from,
    to: to,
    total: total?.toDouble() ?? 0,
  );
}

extension ExpensesByCategoryMapper on ExpensesByCategoryDto {
  ExpensesByCategory toEntity() => ExpensesByCategory(
    storeId: storeId,
    period: period,
    periodLabel: periodLabel,
    currency: currency,
    range: range == null
        ? null
        : ExpenseCategoryRange(from: range!.from, to: range!.to),
    total: total?.toDouble() ?? 0,
    categoriesCount: categoriesCount ?? 0,
    categories: categories?.map((item) => item.toEntity()).toList() ?? const [],
  );
}

extension ExpenseCategoryItemMapper on ExpenseCategoryItemDto {
  ExpenseCategoryItem toEntity() => ExpenseCategoryItem(
    category: category,
    total: total?.toDouble() ?? 0,
    percent: percent?.toDouble() ?? 0,
    transactions: transactions ?? 0,
  );
}

extension ExpensesPeakDaysMapper on ExpensesPeakDaysDto {
  ExpensesPeakDays toEntity() => ExpensesPeakDays(
    storeId: storeId,
    currency: currency,
    count: count ?? 0,
    items: items?.map((item) => item.toEntity()).toList() ?? const [],
  );
}

extension ExpensesPeakDayItemMapper on ExpensesPeakDayItemDto {
  ExpensesPeakDayItem toEntity() => ExpensesPeakDayItem(
    day: day,
    dayFormatted: dayFormatted,
    total: total?.toDouble() ?? 0,
    transactions: transactions ?? 0,
  );
}

extension ExpensesTransactionsMapper on ExpensesTransactionsDto {
  ExpensesTransactions toEntity() => ExpensesTransactions(
    storeId: storeId,
    sort: sort,
    date: date,
    period: period,
    range: range == null
        ? null
        : ExpenseTransactionsRange(from: range!.from, to: range!.to),
    currency: currency,
    totalCount: totalCount ?? 0,
    count: count ?? 0,
    items: items?.map((item) => item.toEntity()).toList() ?? const [],
  );
}

extension ExpensesTransactionItemMapper on ExpensesTransactionItemDto {
  ExpensesTransactionItem toEntity() => ExpensesTransactionItem(
    id: id,
    title: title,
    type: type,
    day: day,
    dayFormatted: dayFormatted,
    value: value?.toDouble() ?? 0,
    notes: notes,
  );
}
