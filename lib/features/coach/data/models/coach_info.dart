// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'coach_info.g.dart';

@JsonSerializable()
class CoachInfoModel {
  final int? id;
  final String? img;
  final String? club_name;
  final String? first_name;
  final String? last_name;
  final String? bio;
  final String? work_time;
  final int? trainer_subscription_price;
  final double? rating;
  final int? comments_amount;
  final Map<String, dynamic>? schedule;
  final List<Map<String, dynamic>>? social_accounts;
  CoachInfoModel(
    this.id,
    this.img,
    this.club_name,
    this.bio,
    this.work_time,
    this.comments_amount,
    this.first_name,
    this.last_name,
    this.rating,
    this.schedule,
    this.trainer_subscription_price,
    this.social_accounts,
  );
  factory CoachInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CoachInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoachInfoModelToJson(this);
}
