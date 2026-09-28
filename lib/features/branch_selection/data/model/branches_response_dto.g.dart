// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchesResponseDto _$BranchesResponseDtoFromJson(Map<String, dynamic> json) =>
    BranchesResponseDto(
      businessId: (json['businessId'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      branchesCount: (json['branchesCount'] as num?)?.toInt(),
      branches: (json['branches'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : BranchDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$BranchesResponseDtoToJson(
  BranchesResponseDto instance,
) => <String, dynamic>{
  'businessId': instance.businessId,
  'count': instance.count,
  'branchesCount': instance.branchesCount,
  'branches': instance.branches,
};

BranchDto _$BranchDtoFromJson(Map<String, dynamic> json) => BranchDto(
  id: (json['id'] as num?)?.toInt(),
  storeName: json['storeName'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
  ownerName: json['ownerName'] as String?,
  isActive: json['isActive'] as bool?,
  createdAt: json['createdAt'] as String?,
  businessId: (json['businessID'] as num?)?.toInt(),
  business: json['business'] == null
      ? null
      : BranchBusinessDto.fromJson(json['business'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BranchDtoToJson(BranchDto instance) => <String, dynamic>{
  'id': instance.id,
  'storeName': instance.storeName,
  'address': instance.address,
  'phone': instance.phone,
  'ownerName': instance.ownerName,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt,
  'businessID': instance.businessId,
  'business': instance.business,
};

BranchBusinessDto _$BranchBusinessDtoFromJson(Map<String, dynamic> json) =>
    BranchBusinessDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      ownerName: json['ownerName'] as String?,
    );

Map<String, dynamic> _$BranchBusinessDtoToJson(BranchBusinessDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ownerName': instance.ownerName,
    };
