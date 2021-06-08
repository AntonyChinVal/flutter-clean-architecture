import 'package:json_annotation/json_annotation.dart';
part 'AppUser.g.dart';

@JsonSerializable()
class AppUser {
  String? name;
  String? lastname;

  AppUser({this.name, this.lastname});

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
