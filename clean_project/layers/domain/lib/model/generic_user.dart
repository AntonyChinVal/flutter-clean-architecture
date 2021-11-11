import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GenericUser {
  String? name;
  String? lastname;

  GenericUser({this.name = "", this.lastname = ""});

  factory GenericUser.fromJson(Map<String, dynamic> json) {
    return GenericUser(
      name: json['name'] as String?,
      lastname: json['lastname'] as String?,
    );
  }

  Map<String, dynamic> toJson(GenericUser instance) => <String, dynamic>{
        'name': instance.name,
        'lastname': instance.lastname,
      };
}
