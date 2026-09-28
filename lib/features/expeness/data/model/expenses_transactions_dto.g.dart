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
  date: json['date'] as String?,
  period: json['period'] as String?,
  range: json['range'] == null
      ? null
      : ExpenseTransactionsRangeDto.fromJson(
          json['range'] as Map<String, dynamic>,
        ),
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
  'date': instance.date,
  'period': instance.period,
  'range': instance.range,
  'currency': instance.currency,
  'totalCount': instance.totalCount,
  'count': instance.count,
  'items': instance.items,
};

ExpenseTransactionsRangeDto _$ExpenseTransactionsRangeDtoFromJson(
  Map<String, dynamic> json,
) => ExpenseTransactionsRangeDto(
  from: json['from'] as String?,
  to: json['to'] as String?,
);

Map<String, dynamic> _$ExpenseTransactionsRangeDtoToJson(
  ExpenseTransactionsRangeDto instance,
) => <String, dynamic>{'from': instance.from, 'to': instance.to};

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
