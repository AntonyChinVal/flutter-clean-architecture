// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericItem _$GenericItemFromJson(Map<String, dynamic> json) {
  return GenericItem(
    name: json['name'] as String?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$GenericItemToJson(GenericItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
