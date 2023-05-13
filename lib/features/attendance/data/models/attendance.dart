// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'attendance.g.dart';

@JsonSerializable()
class Attendance {
  final int id;
  final String date;
  final String arrival_time;
  final String? leaving_time;
  final bool in_gym;
  Attendance(
    this.id,
    this.date,
    this.arrival_time,
    this.leaving_time,
    this.in_gym,
  );
  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
  Map<String, dynamic> toJson() => _$AttendanceToJson(this);
}
