// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrResponseDto _$QrResponseDtoFromJson(Map<String, dynamic> json) =>
    QrResponseDto(
      status: json['status'] as String?,
      business: json['business'] == null
          ? null
          : Business.fromJson(json['business'] as Map<String, dynamic>),
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
      stores: (json['stores'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : QrResponseDtoStores.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$QrResponseDtoToJson(QrResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'business': instance.business,
      'store': instance.store,
      'stores': instance.stores,
      'message': instance.message,
    };

QrResponseDtoStores _$QrResponseDtoStoresFromJson(Map<String, dynamic> json) =>
    QrResponseDtoStores(
      id: (json['id'] as num?)?.toInt(),
      storeName: json['storeName'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      ownerName: json['ownerName'] as String?,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] as String?,
      businessID: (json['businessID'] as num?)?.toInt(),
      business: json['business'],
    );

Map<String, dynamic> _$QrResponseDtoStoresToJson(
  QrResponseDtoStores instance,
) => <String, dynamic>{
  'id': instance.id,
  'storeName': instance.storeName,
  'address': instance.address,
  'phone': instance.phone,
  'ownerName': instance.ownerName,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt,
  'businessID': instance.businessID,
  'business': instance.business,
};

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
  id: (json['id'] as num?)?.toInt(),
  storeName: json['storeName'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
  ownerName: json['ownerName'] as String?,
  isActive: json['isActive'] as bool?,
  createdAt: json['createdAt'] as String?,
  businessID: (json['businessID'] as num?)?.toInt(),
  business: json['business'],
);

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
  'id': instance.id,
  'storeName': instance.storeName,
  'address': instance.address,
  'phone': instance.phone,
  'ownerName': instance.ownerName,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt,
  'businessID': instance.businessID,
  'business': instance.business,
};

Business _$BusinessFromJson(Map<String, dynamic> json) => Business(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  ownerName: json['ownerName'] as String?,
  phone: json['phone'],
  address: json['address'],
  stores: (json['stores'] as List<dynamic>?)
      ?.map(
        (e) => e == null ? null : Stores.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$BusinessToJson(Business instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'ownerName': instance.ownerName,
  'phone': instance.phone,
  'address': instance.address,
  'stores': instance.stores,
};

Stores _$StoresFromJson(Map<String, dynamic> json) => Stores(
  id: (json['id'] as num?)?.toInt(),
  storeName: json['storeName'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
  ownerName: json['ownerName'] as String?,
  isActive: json['isActive'] as bool?,
  createdAt: json['createdAt'] as String?,
  businessID: (json['businessID'] as num?)?.toInt(),
  business: json['business'],
);

Map<String, dynamic> _$StoresToJson(Stores instance) => <String, dynamic>{
  'id': instance.id,
  'storeName': instance.storeName,
  'address': instance.address,
  'phone': instance.phone,
  'ownerName': instance.ownerName,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt,
  'businessID': instance.businessID,
  'business': instance.business,
};
