import 'package:json_annotation/json_annotation.dart';

part 'today_recent_transaction_dto.g.dart';

@JsonSerializable()
class TodayRecentTransactionDto {
  final int id;
  final String orderNumber;
  final String date;
  final String time;
  final double total;
  final String customer;
  final String paymentMethod;

  TodayRecentTransactionDto({
    required this.id,
    required this.orderNumber,
    required this.date,
    required this.time,
    required this.total,
    required this.customer,
    required this.paymentMethod,
  });

  factory TodayRecentTransactionDto.fromJson(Map<String, dynamic> json) => _$TodayRecentTransactionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TodayRecentTransactionDtoToJson(this);
}
