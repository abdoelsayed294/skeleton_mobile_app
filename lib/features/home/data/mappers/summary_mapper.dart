import 'package:skeleton_mobile_app/features/home/data/models/summary_response_dto.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/summary_response.dart';

extension DashboardsammaryResponseMapper on SummaryResponseDto {
  SummaryResponse toEntity() {
    return SummaryResponse(
      businessSummary: businessSummary.toEntity(),
      storeSummary: storeSummary.toEntity(),
      todaySales: todaySales,
      salesChangePct: salesChangePct,
      todayExpenses: todayExpenses,
      expensesChangePct: expensesChangePct,
      todayPurchases: todayPurchases,
      purchasesChangePct: purchasesChangePct,
      netProfit: netProfit,
      netProfitChangePct: netProfitChangePct,
    );
  }
}

extension BusinessSummaryMapper on BusinessSummaryDto {
  BusinessSummary toEntity() {
    return BusinessSummary(businessName: businessName, ownerName: ownerName);
  }
}

extension StoreSummaryMapper on StoreSummaryDto {
  StoreSummary toEntity() {
    return StoreSummary(storeName: storeName);
  }
}
