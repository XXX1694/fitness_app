part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class SetCardInfo extends PaymentEvent {
  final String cardNumber;
  final String cardHolder;
  final String cardDate;
  final String cardCvv;

  const SetCardInfo({
    required this.cardNumber,
    required this.cardHolder,
    required this.cardDate,
    required this.cardCvv,
  });
}
