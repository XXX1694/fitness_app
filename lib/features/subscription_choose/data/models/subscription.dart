// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'subscription.g.dart';

@JsonSerializable()
class Subscription {
  final int id;
  final String title;
  final int price;
  final String description;
  Subscription(
    this.id,
    this.title,
    this.price,
    this.description,
  );
  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}
