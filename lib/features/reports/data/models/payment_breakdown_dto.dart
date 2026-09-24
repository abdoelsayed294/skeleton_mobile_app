import 'package:json_annotation/json_annotation.dart';

part 'payment_breakdown_dto.g.dart';

@JsonSerializable()
class PaymentBreakdownDto {
  final String method;
  final double percent;
  final int count;

  const PaymentBreakdownDto({
    required this.method,
    required this.percent,
    required this.count,
  });

  factory PaymentBreakdownDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentBreakdownDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentBreakdownDtoToJson(this);
}
