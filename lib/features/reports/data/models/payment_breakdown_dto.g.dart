// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_breakdown_dto.dart';

PaymentBreakdownDto _$PaymentBreakdownDtoFromJson(Map<String, dynamic> json) =>
    PaymentBreakdownDto(
      method: json['method'] as String,
      percent: (json['percent'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$PaymentBreakdownDtoToJson(
  PaymentBreakdownDto instance,
) => <String, dynamic>{
  'method': instance.method,
  'percent': instance.percent,
  'count': instance.count,
};
