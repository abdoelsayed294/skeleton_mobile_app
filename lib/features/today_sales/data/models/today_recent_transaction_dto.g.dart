// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_recent_transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayRecentTransactionDto _$TodayRecentTransactionDtoFromJson(
  Map<String, dynamic> json,
) => TodayRecentTransactionDto(
  id: (json['id'] as num?)?.toInt() ?? 0,
  itemName: json['itemName'] as String?,
  name: json['name'] as String?,
  notes: json['notes'] as String?,
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
  total: (json['total'] as num?)?.toDouble() ?? 0.0,
  date: json['date'] as String? ?? '',
  time: json['time'] as String? ?? '',
  displayTime: json['displayTime'] as String?,
  customer: json['customer'] as String?,
);

Map<String, dynamic> _$TodayRecentTransactionDtoToJson(
  TodayRecentTransactionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'itemName': instance.itemName,
  'name': instance.name,
  'notes': instance.notes,
  'quantity': instance.quantity,
  'price': instance.price,
  'total': instance.total,
  'date': instance.date,
  'time': instance.time,
  'displayTime': instance.displayTime,
  'customer': instance.customer,
};
