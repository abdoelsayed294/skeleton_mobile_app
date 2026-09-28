import 'package:json_annotation/json_annotation.dart';

part 'expenses_transactions_dto.g.dart';

@JsonSerializable()
class ExpensesTransactionsDto {
  final int? storeId;
  final String? sort;
  final String? date;
  final String? period;
  final ExpenseTransactionsRangeDto? range;
  final String? currency;
  final int? totalCount;
  final int? count;
  final List<ExpensesTransactionItemDto>? items;
  const ExpensesTransactionsDto({
    this.storeId,
    this.sort,
    this.date,
    this.period,
    this.range,
    this.currency,
    this.totalCount,
    this.count,
    this.items,
  });
  factory ExpensesTransactionsDto.fromJson(Map<String, dynamic> json) =>
      _$ExpensesTransactionsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpensesTransactionsDtoToJson(this);
}

@JsonSerializable()
class ExpenseTransactionsRangeDto {
  final String? from;
  final String? to;

  const ExpenseTransactionsRangeDto({this.from, this.to});

  factory ExpenseTransactionsRangeDto.fromJson(Map<String, dynamic> json) =>
      _$ExpenseTransactionsRangeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseTransactionsRangeDtoToJson(this);
}

@JsonSerializable()
class ExpensesTransactionItemDto {
  final int? id;
  final String? title;
  final String? type;
  final String? day;
  final String? dayFormatted;
  final num? value;
  final String? notes;
  const ExpensesTransactionItemDto({
    this.id,
    this.title,
    this.type,
    this.day,
    this.dayFormatted,
    this.value,
    this.notes,
  });
  factory ExpensesTransactionItemDto.fromJson(Map<String, dynamic> json) =>
      _$ExpensesTransactionItemDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExpensesTransactionItemDtoToJson(this);
}
