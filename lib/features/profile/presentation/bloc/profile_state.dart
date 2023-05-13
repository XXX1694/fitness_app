part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileInfoGot extends ProfileState {
  final Profile profile;
  const ProfileInfoGot({required this.profile});
}

class ProfileInfoGetting extends ProfileState {}

class ConnectionError extends ProfileState {}

class ProfileGettingError extends ProfileState {
  final String message;
  const ProfileGettingError({required this.message});
}
