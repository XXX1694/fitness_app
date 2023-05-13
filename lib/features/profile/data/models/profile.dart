// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final int id;
  final String? first_name;
  final String? last_name;
  final String? phone;
  final String? image;
  final String? subscription;
  final String? coach;
  Profile(
    this.id,
    this.first_name,
    this.last_name,
    this.phone,
    this.image,
    this.subscription,
    this.coach,
  );
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
