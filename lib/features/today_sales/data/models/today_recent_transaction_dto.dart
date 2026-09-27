import 'package:json_annotation/json_annotation.dart';

part 'today_recent_transaction_dto.g.dart';

@JsonSerializable()
class TodayRecentTransactionDto {
  @JsonKey(defaultValue: 0)
  final int id;
  final String? itemName;
  final String? name;
  final String? notes;
  @JsonKey(defaultValue: 0)
  final int quantity;
  @JsonKey(defaultValue: 0.0)
  final double price;
  @JsonKey(defaultValue: 0.0)
  final double total;
  @JsonKey(defaultValue: '')
  final String date;
  @JsonKey(defaultValue: '')
  final String time;
  final String? displayTime;
  final String? customer;

  TodayRecentTransactionDto({
    required this.id,
    this.itemName,
    this.name,
    this.notes,
    required this.quantity,
    required this.price,
    required this.total,
    required this.date,
    required this.time,
    this.displayTime,
    this.customer,
  });

  factory TodayRecentTransactionDto.fromJson(Map<String, dynamic> json) =>
      _$TodayRecentTransactionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TodayRecentTransactionDtoToJson(this);
}
