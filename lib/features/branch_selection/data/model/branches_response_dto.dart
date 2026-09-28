import 'package:json_annotation/json_annotation.dart';

part 'branches_response_dto.g.dart';

@JsonSerializable()
class BranchesResponseDto {
  @JsonKey(name: 'businessId')
  final int? businessId;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'branchesCount')
  final int? branchesCount;
  @JsonKey(name: 'branches')
  final List<BranchDto?>? branches;

  BranchesResponseDto({
    this.businessId,
    this.count,
    this.branchesCount,
    this.branches,
  });

  factory BranchesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BranchesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BranchesResponseDtoToJson(this);
}

@JsonSerializable()
class BranchDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'storeName')
  final String? storeName;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'ownerName')
  final String? ownerName;
  @JsonKey(name: 'isActive')
  final bool? isActive;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'businessID')
  final int? businessId;
  @JsonKey(name: 'business')
  final BranchBusinessDto? business;

  BranchDto({
    this.id,
    this.storeName,
    this.address,
    this.phone,
    this.ownerName,
    this.isActive,
    this.createdAt,
    this.businessId,
    this.business,
  });

  factory BranchDto.fromJson(Map<String, dynamic> json) =>
      _$BranchDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BranchDtoToJson(this);
}

@JsonSerializable()
class BranchBusinessDto {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'ownerName')
  final String? ownerName;

  BranchBusinessDto({this.id, this.name, this.ownerName});

  factory BranchBusinessDto.fromJson(Map<String, dynamic> json) =>
      _$BranchBusinessDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BranchBusinessDtoToJson(this);
}
