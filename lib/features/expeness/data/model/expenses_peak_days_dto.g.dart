// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_peak_days_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpensesPeakDaysDto _$ExpensesPeakDaysDtoFromJson(Map<String, dynamic> json) =>
    ExpensesPeakDaysDto(
      storeId: (json['storeId'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      count: (json['count'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map(
            (e) => ExpensesPeakDayItemDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$ExpensesPeakDaysDtoToJson(
  ExpensesPeakDaysDto instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'currency': instance.currency,
  'count': instance.count,
  'items': instance.items,
};

ExpensesPeakDayItemDto _$ExpensesPeakDayItemDtoFromJson(
  Map<String, dynamic> json,
) => ExpensesPeakDayItemDto(
  day: json['day'] as String?,
  dayFormatted: json['dayFormatted'] as String?,
  total: json['total'] as num?,
  transactions: (json['transactions'] as num?)?.toInt(),
);

Map<String, dynamic> _$ExpensesPeakDayItemDtoToJson(
  ExpensesPeakDayItemDto instance,
) => <String, dynamic>{
  'day': instance.day,
  'dayFormatted': instance.dayFormatted,
  'total': instance.total,
  'transactions': instance.transactions,
};
