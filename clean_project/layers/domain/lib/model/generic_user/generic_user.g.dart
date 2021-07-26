// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericUser _$GenericUserFromJson(Map<String, dynamic> json) {
  return GenericUser(
    name: json['name'] as String?,
    lastname: json['lastname'] as String?,
  );
}

Map<String, dynamic> _$GenericUserToJson(GenericUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastname': instance.lastname,
    };
