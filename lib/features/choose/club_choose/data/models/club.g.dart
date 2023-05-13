// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Club _$ClubFromJson(Map<String, dynamic> json) => Club(
      json['id'] as int,
      json['company'] as int,
      json['branch_name'] as String,
      json['address'] as String,
      json['phone'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$ClubToJson(Club instance) => <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'branch_name': instance.branch_name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
    };
