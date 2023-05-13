// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'club.g.dart';

@JsonSerializable()
class Club {
  final int id;
  final int company;
  final String branch_name;
  final String address;
  final String phone;
  final String email;
  Club(
    this.id,
    this.company,
    this.branch_name,
    this.address,
    this.phone,
    this.email,
  );
  factory Club.fromJson(Map<String, dynamic> json) => _$ClubFromJson(json);
  Map<String, dynamic> toJson() => _$ClubToJson(this);
}
