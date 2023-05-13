import 'package:equatable/equatable.dart';
import 'package:tamos_family_club/features/profile/data/models/profile.dart';
import 'package:tamos_family_club/features/profile/data/repositories/profile_repository.dart';
import 'package:tamos_family_club/services/network_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final networkInfo = NetworkInfo();
  ProfileRepository repo;
  ProfileBloc({
    required this.repo,
    required ProfileState profileState,
  }) : super(ProfileInitial()) {
    on<GetProfileInfo>((event, emit) async {
      emit(ProfileInfoGetting());
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        if (kDebugMode) {
          print('Profile get: No internet connection');
        }
        emit(ConnectionError());
      } else {
        try {
          Profile res = await repo.getProfileData();
          if (kDebugMode) {
            print('Profile get: Success');
            print('Data:');
            print(res.toJson().toString());
          }
          emit(ProfileInfoGot(profile: res));
        } catch (e) {
          if (kDebugMode) {
            print('Profiel get: Error $e');
          }
          emit(ProfileGettingError(message: e.toString()));
        }
      }
    });
  }
}
