import 'package:json_annotation/json_annotation.dart';
part 'generic_user.g.dart';

@JsonSerializable()
class GenericUser {
  String? name;
  String? lastname;

  GenericUser({this.name = "", this.lastname = ""});

  factory GenericUser.fromJson(Map<String, dynamic> json) =>
      _$GenericUserFromJson(json);

  Map<String, dynamic> toJson() => _$GenericUserToJson(this);
}
