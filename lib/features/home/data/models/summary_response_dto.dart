import 'package:json_annotation/json_annotation.dart';

part 'summary_response_dto.g.dart';

@JsonSerializable()
class SummaryResponseDto {
  @JsonKey(name: 'date')
  final DateTime date;
  @JsonKey(name: 'storeId')
  final int storeId;
  @JsonKey(name: 'business')
  final BusinessSummaryDto businessSummary;
  @JsonKey(name: 'store')
  final StoreSummaryDto storeSummary;
  @JsonKey(name: 'todaySales')
  final double todaySales;
  @JsonKey(name: 'salesChangePct')
  final double salesChangePct;
  @JsonKey(name: 'todayExpenses')
  final double todayExpenses;
  @JsonKey(name: 'expensesChangePct')
  final double expensesChangePct;
  @JsonKey(name: 'todayPurchases')
  final double todayPurchases;
  @JsonKey(name: 'purchasesChangePct')
  final double purchasesChangePct;
  @JsonKey(name: 'netProfit')
  final double netProfit;
  @JsonKey(name: 'netProfitChangePct')
  final double netProfitChangePct;
  @JsonKey(name: 'cogs')
  final int cogs;
  @JsonKey(name: 'totalProducts')
  final int totalProducts;

  SummaryResponseDto({
    required this.date,
    required this.storeId,
    required this.businessSummary,
    required this.storeSummary,
    required this.todaySales,
    required this.salesChangePct,
    required this.todayExpenses,
    required this.expensesChangePct,
    required this.todayPurchases,
    required this.purchasesChangePct,
    required this.netProfit,
    required this.netProfitChangePct,
    required this.cogs,
    required this.totalProducts,
  });

  factory SummaryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SummaryResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryResponseDtoToJson(this);
}

@JsonSerializable()
class BusinessSummaryDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String businessName;
  @JsonKey(name: 'ownerName')
  final String? ownerName;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'address')
  final String? address;

  BusinessSummaryDto({required this.id, required this.businessName, this.ownerName, this.phone, this.address});

  factory BusinessSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$BusinessSummaryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessSummaryDtoToJson(this);
}


@JsonSerializable()
class StoreSummaryDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'storeName')
  final String storeName;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'businessId')
  final int businessId;

  StoreSummaryDto({required this.id, required this.storeName, this.address, this.phone, required this.businessId});

  factory StoreSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$StoreSummaryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StoreSummaryDtoToJson(this);
}
