import 'package:equatable/equatable.dart';
import 'package:tamos_family_club/features/subscription_choose/data/models/subscription.dart';
import 'package:tamos_family_club/features/subscription_choose/data/repositories/subscription_repository.dart';
import 'package:tamos_family_club/services/network_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subscription_choose_event.dart';
part 'subscription_choose_state.dart';

class SubscriptionChooseBloc
    extends Bloc<SubscriptionChooseEvent, SubscriptionChooseState> {
  final networkInfo = NetworkInfo();
  SubscriptionRepository repo;
  SubscriptionChooseBloc({
    required this.repo,
    required SubscriptionChooseState subscriptionState,
  }) : super(SubscriptionChooseInitial()) {
    on<GetSubscription>(
      (event, emit) async {
        emit(SubscriptionGetting());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          if (kDebugMode) {
            print('Subscription get: No internet connection');
          }
          emit(ConnectionError());
        } else {
          try {
            List<Subscription> res = await repo.getSubscription();
            if (kDebugMode) {
              print('Subscription get: Success');
            }
            emit(SubscriptionGot(subList: res));
          } catch (e) {
            if (kDebugMode) {
              print('Subscription get: Error $e');
            }
            emit(SubscriptionGetError(message: e.toString()));
          }
        }
      },
    );

    on<SetSubscribtion>(
      (event, emit) async {
        emit(SubscriptionSetting());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          if (kDebugMode) {
            print('Subscription set: No internet connection');
          }
          emit(ConnectionError());
        } else {
          try {
            await repo.setSubscribtion(event.subscriptionID + 1);
            if (kDebugMode) {
              print('Subscription set: Success');
            }
            emit(SubscriptionSet());
          } catch (e) {
            if (kDebugMode) {
              print('Subscription set: Error $e');
            }
            emit(SubscriptionSetError(message: e.toString()));
          }
        }
      },
    );
  }
}
