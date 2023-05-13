// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachInfoModel _$CoachInfoModelFromJson(Map<String, dynamic> json) =>
    CoachInfoModel(
      json['id'] as int?,
      json['img'] as String?,
      json['club_name'] as String?,
      json['bio'] as String?,
      json['work_time'] as String?,
      json['comments_amount'] as int?,
      json['first_name'] as String?,
      json['last_name'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['schedule'] as Map<String, dynamic>?,
      json['trainer_subscription_price'] as int?,
      (json['social_accounts'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$CoachInfoModelToJson(CoachInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'club_name': instance.club_name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'bio': instance.bio,
      'work_time': instance.work_time,
      'trainer_subscription_price': instance.trainer_subscription_price,
      'rating': instance.rating,
      'comments_amount': instance.comments_amount,
      'schedule': instance.schedule,
      'social_accounts': instance.social_accounts,
    };
