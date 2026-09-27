// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_by_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpensesByCategoryDto _$ExpensesByCategoryDtoFromJson(
  Map<String, dynamic> json,
) => ExpensesByCategoryDto(
  storeId: (json['storeId'] as num?)?.toInt(),
  period: json['period'] as String?,
  periodLabel: json['periodLabel'] as String?,
  currency: json['currency'] as String?,
  range: json['range'] == null
      ? null
      : ExpenseCategoryRangeDto.fromJson(json['range'] as Map<String, dynamic>),
  total: json['total'] as num?,
  categoriesCount: (json['categoriesCount'] as num?)?.toInt(),
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => ExpenseCategoryItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ExpensesByCategoryDtoToJson(
  ExpensesByCategoryDto instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'period': instance.period,
  'periodLabel': instance.periodLabel,
  'currency': instance.currency,
  'range': instance.range,
  'total': instance.total,
  'categoriesCount': instance.categoriesCount,
  'categories': instance.categories,
};

ExpenseCategoryRangeDto _$ExpenseCategoryRangeDtoFromJson(
  Map<String, dynamic> json,
) => ExpenseCategoryRangeDto(
  from: json['from'] as String?,
  to: json['to'] as String?,
);

Map<String, dynamic> _$ExpenseCategoryRangeDtoToJson(
  ExpenseCategoryRangeDto instance,
) => <String, dynamic>{'from': instance.from, 'to': instance.to};

ExpenseCategoryItemDto _$ExpenseCategoryItemDtoFromJson(
  Map<String, dynamic> json,
) => ExpenseCategoryItemDto(
  category: json['category'] as String?,
  total: json['total'] as num?,
  percent: json['percent'] as num?,
  transactions: (json['transactions'] as num?)?.toInt(),
);

Map<String, dynamic> _$ExpenseCategoryItemDtoToJson(
  ExpenseCategoryItemDto instance,
) => <String, dynamic>{
  'category': instance.category,
  'total': instance.total,
  'percent': instance.percent,
  'transactions': instance.transactions,
};
