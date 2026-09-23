// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentTransactionDto _$RecentTransactionDtoFromJson(
  Map<String, dynamic> json,
) => RecentTransactionDto(
  id: (json['id'] as num).toInt(),
  orderNumber: json['orderNumber'] as String,
  date: json['date'] as String,
  time: json['time'] as String,
  total: (json['total'] as num).toDouble(),
  amount: (json['amount'] as num).toDouble(),
  customer: json['customer'] as String,
  paymentMethod: json['paymentMethod'] as String,
  method: json['method'] as String,
);

Map<String, dynamic> _$RecentTransactionDtoToJson(
  RecentTransactionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'orderNumber': instance.orderNumber,
  'date': instance.date,
  'time': instance.time,
  'total': instance.total,
  'amount': instance.amount,
  'customer': instance.customer,
  'paymentMethod': instance.paymentMethod,
  'method': instance.method,
};
