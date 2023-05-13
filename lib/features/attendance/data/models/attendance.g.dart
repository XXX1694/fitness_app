// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attendance _$AttendanceFromJson(Map<String, dynamic> json) => Attendance(
      json['id'] as int,
      json['date'] as String,
      json['arrival_time'] as String,
      json['leaving_time'] as String?,
      json['in_gym'] as bool,
    );

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'arrival_time': instance.arrival_time,
      'leaving_time': instance.leaving_time,
      'in_gym': instance.in_gym,
    };
