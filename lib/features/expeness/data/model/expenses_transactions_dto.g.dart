// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_transactions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpensesTransactionsDto _$ExpensesTransactionsDtoFromJson(
  Map<String, dynamic> json,
) => ExpensesTransactionsDto(
  storeId: (json['storeId'] as num?)?.toInt(),
  sort: json['sort'] as String?,
  currency: json['currency'] as String?,
  totalCount: (json['totalCount'] as num?)?.toInt(),
  count: (json['count'] as num?)?.toInt(),
  items: (json['items'] as List<dynamic>?)
      ?.map(
        (e) => ExpensesTransactionItemDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ExpensesTransactionsDtoToJson(
  ExpensesTransactionsDto instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'sort': instance.sort,
  'currency': instance.currency,
  'totalCount': instance.totalCount,
  'count': instance.count,
  'items': instance.items,
};

ExpensesTransactionItemDto _$ExpensesTransactionItemDtoFromJson(
  Map<String, dynamic> json,
) => ExpensesTransactionItemDto(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  type: json['type'] as String?,
  day: json['day'] as String?,
  dayFormatted: json['dayFormatted'] as String?,
  value: json['value'] as num?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$ExpensesTransactionItemDtoToJson(
  ExpensesTransactionItemDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'type': instance.type,
  'day': instance.day,
  'dayFormatted': instance.dayFormatted,
  'value': instance.value,
  'notes': instance.notes,
};
