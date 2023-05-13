import 'package:equatable/equatable.dart';
import 'package:tamos_family_club/features/change_password/data/repositories/change_password_repository.dart';
import 'package:tamos_family_club/services/network_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final networkInfo = NetworkInfo();
  ChangePasswordRepository repo;

  ChangePasswordBloc({
    required this.repo,
    required ChangePasswordState passwordState,
  }) : super(ChangePasswordInitial()) {
    on<ChangePassword>(
      (event, emit) async {
        emit(PasswordChanging());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          if (kDebugMode) {
            print('App: No internet connection');
          }
          emit(ConnectionError());
        } else {
          try {
            bool changePass =
                await repo.changePassword(event.currentPass, event.newPass);
            if (changePass) {
              emit(PasswordChanged());
              if (kDebugMode) {
                print('Change password: Success');
                print(
                    'Change password: Password changed ${event.currentPass} -> ${event.newPass}');
              }
            } else {
              if (kDebugMode) {
                print('Change password: Error');
              }
              emit(const PasswordChangeError('Something went wrong'));
            }
          } catch (e) {
            if (kDebugMode) {
              print('Change password: Error - $e');
            }
            emit(PasswordChangeError(e.toString()));
          }
        }
      },
    );
  }
}
