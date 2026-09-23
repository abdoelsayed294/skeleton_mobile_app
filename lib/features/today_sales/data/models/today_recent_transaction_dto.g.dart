// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_recent_transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayRecentTransactionDto _$TodayRecentTransactionDtoFromJson(
  Map<String, dynamic> json,
) => TodayRecentTransactionDto(
  id: (json['id'] as num).toInt(),
  orderNumber: json['orderNumber'] as String,
  date: json['date'] as String,
  time: json['time'] as String,
  total: (json['total'] as num).toDouble(),
  customer: json['customer'] as String,
  paymentMethod: json['paymentMethod'] as String,
);

Map<String, dynamic> _$TodayRecentTransactionDtoToJson(
  TodayRecentTransactionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'orderNumber': instance.orderNumber,
  'date': instance.date,
  'time': instance.time,
  'total': instance.total,
  'customer': instance.customer,
  'paymentMethod': instance.paymentMethod,
};
