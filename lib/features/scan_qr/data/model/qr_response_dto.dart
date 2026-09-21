import 'package:json_annotation/json_annotation.dart';
part 'qr_response_dto.g.dart';

@JsonSerializable()
class QrResponseDto {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'business')
  final Business? business;
  @JsonKey(name: 'store')
  final Store? store;
  @JsonKey(name: 'stores')
  final List<QrResponseDtoStores?>? stores;
  @JsonKey(name: 'message')
  final String? message;

  QrResponseDto({
    this.status,
    this.business,
    this.store,
    this.stores,
    this.message,
  });

  factory QrResponseDto.fromJson(Map<String, dynamic> json) => _$QrResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$QrResponseDtoToJson(this);
}

@JsonSerializable()
class QrResponseDtoStores {
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
  final int? businessID;
  @JsonKey(name: 'business')
  final dynamic business;

  QrResponseDtoStores({
    this.id,
    this.storeName,
    this.address,
    this.phone,
    this.ownerName,
    this.isActive,
    this.createdAt,
    this.businessID,
    this.business,
  });

  factory QrResponseDtoStores.fromJson(Map<String, dynamic> json) => _$QrResponseDtoStoresFromJson(json);
  Map<String, dynamic> toJson() => _$QrResponseDtoStoresToJson(this);
}

@JsonSerializable()
class Store {
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
  final int? businessID;
  @JsonKey(name: 'business')
  final dynamic business;

  Store({
    this.id,
    this.storeName,
    this.address,
    this.phone,
    this.ownerName,
    this.isActive,
    this.createdAt,
    this.businessID,
    this.business,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}

@JsonSerializable()
class Business {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'ownerName')
  final String? ownerName;
  @JsonKey(name: 'phone')
  final dynamic phone;
  @JsonKey(name: 'address')
  final dynamic address;
  @JsonKey(name: 'stores')
  final List<Stores?>? stores;

  Business({
    this.id,
    this.name,
    this.ownerName,
    this.phone,
    this.address,
    this.stores,
  });

  factory Business.fromJson(Map<String, dynamic> json) => _$BusinessFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessToJson(this);
}

@JsonSerializable()
class Stores {
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
  final int? businessID;
  @JsonKey(name: 'business')
  final dynamic business;

  Stores({
    this.id,
    this.storeName,
    this.address,
    this.phone,
    this.ownerName,
    this.isActive,
    this.createdAt,
    this.businessID,
    this.business,
  });

  factory Stores.fromJson(Map<String, dynamic> json) => _$StoresFromJson(json);
  Map<String, dynamic> toJson() => _$StoresToJson(this);
}