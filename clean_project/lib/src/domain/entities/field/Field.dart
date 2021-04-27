import 'package:json_annotation/json_annotation.dart';
part 'Field.g.dart';

@JsonSerializable() 
class Field{
  
  String? name;
  String? image;

  Field({this.name, this.image});

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);

  Map<String, dynamic> toJson() => _$FieldToJson(this);

}