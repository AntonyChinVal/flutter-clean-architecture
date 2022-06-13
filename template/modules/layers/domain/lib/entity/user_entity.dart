import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SessionUser {
  int? id;
  String? name;
  String? lastname;

  SessionUser({
    this.id,
    this.name,
    this.lastname,
  });

  factory SessionUser.fromJson(Map<String, dynamic> json) {
    return SessionUser(
        id: json['id'] as int?,
        name: json['name'] as String?,
        lastname: json['lastname'] as String?);
  }

  Map<String, dynamic> toJson(SessionUser instance) => <String, dynamic>{
        'id': instance.id,
        'name': instance.name,
        'lastname': instance.lastname,
      };
}
