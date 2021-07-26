import 'package:json_annotation/json_annotation.dart';
part 'generic_item.g.dart';

@JsonSerializable()
class GenericItem {
  String? name;
  String? image;

  GenericItem({this.name, this.image});

  factory GenericItem.fromJson(Map<String, dynamic> json) =>
      _$GenericItemFromJson(json);

  Map<String, dynamic> toJson() => _$GenericItemToJson(this);
}
