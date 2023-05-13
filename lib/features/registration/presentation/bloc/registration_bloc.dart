import 'package:equatable/equatable.dart';
import 'package:tamos_family_club/features/registration/data/repositories/registration_repository.dart';
import 'package:tamos_family_club/services/network_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final networkInfo = NetworkInfo();
  RegistrationRepository repo;

  RegistrationBloc({
    required this.repo,
    required RegistrationState registrationState,
  }) : super(RegistrationInitial()) {
    on<CreateUser>(
      (event, emit) async {
        emit(UserCreating());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          if (kDebugMode) {
            print('User create: No internet connection');
          }
          emit(ConnectionError());
        } else {
          try {
            bool res = await repo.createUser(event.username, event.password);

            if (res) {
              emit(UserCreated());
            } else {
              emit(const UserCreateError(message: 'Something went wrong'));
            }
          } catch (e) {
            if (kDebugMode) {
              print('User create: Error - $e');
            }
            emit(UserCreateError(message: e.toString()));
          }
        }
      },
    );
    on<CreateProfile>(
      (event, emit) async {
        emit(ProfileCreating());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          if (kDebugMode) {
            print('User edit: No internet connection');
          }
          emit(ConnectionError());
        } else {
          try {
            bool res = await repo.editProfile(
              event.firstName,
              event.lastName,
              event.birthDate,
              event.phoneNumber,
              event.email,
            );
            if (res) {
              if (kDebugMode) {
                print('Profile create: Success');
              }
              emit(ProfileCreated());
            } else {
              if (kDebugMode) {
                print('Profile create: Error');
              }
              emit(
                const ProfileCreateError(message: 'Something went wrong!'),
              );
            }
          } catch (e) {
            if (kDebugMode) {
              print('Profile create: Error');
            }
            emit(ProfileCreateError(message: e.toString()));
          }
          try {
            bool res = await repo.clientCreate();
            if (res) {
              if (kDebugMode) {
                print('Client create: Success');
              }
            } else {
              if (kDebugMode) {
                print('Client create: Error');
              }
              emit(
                const ProfileCreateError(
                  message: 'Something went wrong!',
                ),
              );
            }
          } catch (e) {
            if (kDebugMode) {
              print('Client create: Error');
            }
            emit(ProfileCreateError(message: e.toString()));
          }
        }
      },
    );
  }
}
