part of 'subscription_choose_bloc.dart';

class SubscriptionChooseState extends Equatable {
  const SubscriptionChooseState();

  @override
  List<Object> get props => [];
}

class SubscriptionChooseInitial extends SubscriptionChooseState {}

class SubscriptionGetting extends SubscriptionChooseState {}

class SubscriptionSetting extends SubscriptionChooseState {}

class ConnectionError extends SubscriptionChooseState {}

class SubscriptionGot extends SubscriptionChooseState {
  final List<Subscription> subList;
  const SubscriptionGot({required this.subList});
}

class SubscriptionSet extends SubscriptionChooseState {}

class SubscriptionGetError extends SubscriptionChooseState {
  final String message;
  const SubscriptionGetError({required this.message});
}

class SubscriptionSetError extends SubscriptionChooseState {
  final String message;
  const SubscriptionSetError({required this.message});
}
