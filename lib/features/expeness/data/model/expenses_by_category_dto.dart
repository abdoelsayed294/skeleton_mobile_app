import 'package:json_annotation/json_annotation.dart';

part 'expenses_by_category_dto.g.dart';

@JsonSerializable()
class ExpensesByCategoryDto {
  final int? storeId;
  final String? period;
  final String? periodLabel;
  final String? currency;
  final ExpenseCategoryRangeDto? range;
  final num? total;
  final int? categoriesCount;
  final List<ExpenseCategoryItemDto>? categories;
  const ExpensesByCategoryDto({
    this.storeId,
    this.period,
    this.periodLabel,
    this.currency,
    this.range,
    this.total,
    this.categoriesCount,
    this.categories,
  });
  factory ExpensesByCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$ExpensesByCategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpensesByCategoryDtoToJson(this);
}

@JsonSerializable()
class ExpenseCategoryRangeDto {
  final String? from;
  final String? to;
  const ExpenseCategoryRangeDto({this.from, this.to});
  factory ExpenseCategoryRangeDto.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryRangeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpenseCategoryRangeDtoToJson(this);
}

@JsonSerializable()
class ExpenseCategoryItemDto {
  final String? category;
  final num? total;
  final num? percent;
  final int? transactions;
  const ExpenseCategoryItemDto({
    this.category,
    this.total,
    this.percent,
    this.transactions,
  });
  factory ExpenseCategoryItemDto.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryItemDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpenseCategoryItemDtoToJson(this);
}
