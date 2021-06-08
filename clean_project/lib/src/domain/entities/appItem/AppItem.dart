import 'package:json_annotation/json_annotation.dart';
part 'AppItem.g.dart';

@JsonSerializable()
class AppItem {
  String? name;
  String? image;

  AppItem({this.name, this.image});

  factory AppItem.fromJson(Map<String, dynamic> json) =>
      _$AppItemFromJson(json);

  Map<String, dynamic> toJson() => _$AppItemToJson(this);
}
