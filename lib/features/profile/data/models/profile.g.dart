// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      json['id'] as int,
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['phone'] as String?,
      json['image'] as String?,
      json['subscription'] as String?,
      json['coach'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone': instance.phone,
      'image': instance.image,
      'subscription': instance.subscription,
      'coach': instance.coach,
    };
