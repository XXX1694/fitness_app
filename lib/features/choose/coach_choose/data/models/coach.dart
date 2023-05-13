// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'coach.g.dart';

@JsonSerializable()
class Coach {
  final int? id;
  final String? img;
  final String? name;
  final int? price;
  final double? rating;
  Coach(
    this.id,
    this.img,
    this.name,
    this.price,
    this.rating,
  );
  factory Coach.fromJson(Map<String, dynamic> json) => _$CoachFromJson(json);
  Map<String, dynamic> toJson() => _$CoachToJson(this);
}
