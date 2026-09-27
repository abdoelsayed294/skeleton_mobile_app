import 'package:json_annotation/json_annotation.dart';

part 'expenses_peak_days_dto.g.dart';

@JsonSerializable()
class ExpensesPeakDaysDto {
  final int? storeId;
  final String? currency;
  final int? count;
  final List<ExpensesPeakDayItemDto>? items;
  const ExpensesPeakDaysDto({
    this.storeId,
    this.currency,
    this.count,
    this.items,
  });
  factory ExpensesPeakDaysDto.fromJson(Map<String, dynamic> json) =>
      _$ExpensesPeakDaysDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpensesPeakDaysDtoToJson(this);
}

@JsonSerializable()
class ExpensesPeakDayItemDto {
  final String? day;
  final String? dayFormatted;
  final num? total;
  final int? transactions;
  const ExpensesPeakDayItemDto({
    this.day,
    this.dayFormatted,
    this.total,
    this.transactions,
  });
  factory ExpensesPeakDayItemDto.fromJson(Map<String, dynamic> json) =>
      _$ExpensesPeakDayItemDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpensesPeakDayItemDtoToJson(this);
}
