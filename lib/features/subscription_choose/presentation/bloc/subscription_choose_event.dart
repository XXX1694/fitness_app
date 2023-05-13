part of 'subscription_choose_bloc.dart';

abstract class SubscriptionChooseEvent extends Equatable {
  const SubscriptionChooseEvent();

  @override
  List<Object> get props => [];
}

class GetSubscription extends SubscriptionChooseEvent {}

class SetSubscribtion extends SubscriptionChooseEvent {
  final int subscriptionID;
  const SetSubscribtion({required this.subscriptionID});
}
