import 'package:json_annotation/json_annotation.dart';

part 'recent_transaction_dto.g.dart';

@JsonSerializable()
class RecentTransactionDto {
  final int id;
  final String orderNumber;
  final String date;
  final String time;
  final double total;
  final double amount;
  final String customer;
  final String paymentMethod;
  final String method;

  RecentTransactionDto({
    required this.id,
    required this.orderNumber,
    required this.date,
    required this.time,
    required this.total,
    required this.amount,
    required this.customer,
    required this.paymentMethod,
    required this.method,
  });

  factory RecentTransactionDto.fromJson(Map<String, dynamic> json) =>
      _$RecentTransactionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecentTransactionDtoToJson(this);
}
