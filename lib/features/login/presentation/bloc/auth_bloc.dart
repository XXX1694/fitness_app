import 'package:equatable/equatable.dart';
import 'package:tamos_family_club/features/login/data/repositories/user_auth_repository.dart';
import 'package:tamos_family_club/services/network_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final networkInfo = NetworkInfo();
  UserAuthRepository repo;

  AuthBloc({
    required this.repo,
    required AuthState userState,
  }) : super(UserOffline()) {
    on<LogIn>(
      (event, emit) async {
        emit(UserLoading());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          if (kDebugMode) {
            print('App: No internet connection');
          }
          emit(ConnectionError());
        } else {
          try {
            bool res1 = await repo.userLogIn(event.username, event.password);
            bool res2 = await repo.gerClientID();
            await repo.gerUserID();
            if (res1 && res2) {
              emit(UserOnline());
              if (kDebugMode) {
                print('User Auth: Success');
              }
            } else {
              if (kDebugMode) {
                print('User Auth: Error');
              }
              emit(const UserLogError(message: 'Something went wrong'));
            }
          } catch (e) {
            if (kDebugMode) {
              print('User Auth: Error - $e');
            }
            emit(UserLogError(message: e.toString()));
          }
        }
      },
    );

    on<GetUserStatus>(
      (event, emit) async {
        final isOnline = await repo.isUserOnline();
        bool res = await repo.gerClientID();
        if (isOnline && res) {
          emit(UserOnline());
        } else {
          emit(UserOffline());
        }
      },
    );

    on<LogOut>(
      (event, emit) async {
        bool logOut = await repo.userLogOut();
        if (logOut) {
          emit(UserOffline());
        } else {
          emit(const UserLogError(message: 'User log out error'));
        }
      },
    );
  }
}
