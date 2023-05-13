// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coach _$CoachFromJson(Map<String, dynamic> json) => Coach(
      json['id'] as int?,
      json['img'] as String?,
      json['name'] as String?,
      json['price'] as int?,
      (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoachToJson(Coach instance) => <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'name': instance.name,
      'price': instance.price,
      'rating': instance.rating,
    };
