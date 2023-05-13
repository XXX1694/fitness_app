part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class ConnectionError extends PaymentState {}

class CardCreating extends PaymentState {}

class CardCreated extends PaymentState {}

class CardCreateError extends PaymentState {
  final String message;
  const CardCreateError({required this.message});
}
