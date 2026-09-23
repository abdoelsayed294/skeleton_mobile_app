import 'package:json_annotation/json_annotation.dart';

part 'top_selling_dto.g.dart';

@JsonSerializable()
class TopSellingDto {
  @JsonKey(name: 'itemName')
  final String itemName;

  @JsonKey(name: 'unitsSold')
  final int unitsSold;

  @JsonKey(name: 'revenue')
  final double revenue;

  @JsonKey(name: 'revenuePct')
  final double revenuePct;

  @JsonKey(name: 'changePct')
  final double changePct;

  TopSellingDto({
    required this.itemName,
    required this.unitsSold,
    required this.revenue,
    required this.revenuePct,
    required this.changePct,
  });

  factory TopSellingDto.fromJson(Map<String, dynamic> json) =>
      _$TopSellingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TopSellingDtoToJson(this);
}
