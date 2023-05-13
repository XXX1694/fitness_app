import 'package:equatable/equatable.dart';
import 'package:tamos_family_club/features/payment/data/repositories/payment_repository.dart';
import 'package:tamos_family_club/services/network_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final networkInfo = NetworkInfo();
  PaymentRepository repo;
  PaymentBloc({
    required this.repo,
    required PaymentState paymentState,
  }) : super(PaymentInitial()) {
    on<SetCardInfo>((event, emit) async {
      emit(CardCreating());
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        if (kDebugMode) {
          print('Card create: No internet connection');
        }
        emit(ConnectionError());
      } else {
        try {
          String cardNum = (event.cardNumber).trim().replaceAll(' ', '');

          final res = await repo.setCardInfo(
              cardNum, event.cardHolder, event.cardCvv, event.cardDate);
          if (res == true) {
            if (kDebugMode) {
              print('Card create: Success');
            }
            emit(CardCreated());
          } else {
            if (kDebugMode) {
              print('Card create: Error');
            }
            emit(CardCreateError(message: res.toString()));
          }
        } catch (e) {
          if (kDebugMode) {
            print('Card create: Error');
          }
          emit(CardCreateError(message: e.toString()));
        }
      }
    });
  }
}
