import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Topic {
  String? name;
  String? image;

  Topic({this.name = "", this.image = ""});

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson(Topic instance) => <String, dynamic>{
        'name': instance.name,
        'image': instance.image,
      };
}
