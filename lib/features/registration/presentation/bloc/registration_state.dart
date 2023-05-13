part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class ConnectionError extends RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class UserCreating extends RegistrationState {}

class UserCreated extends RegistrationState {}

class UserCreateError extends RegistrationState {
  final String message;
  const UserCreateError({required this.message});
}

class ProfileCreating extends RegistrationState {}

class ProfileCreated extends RegistrationState {}

class ProfileCreateError extends RegistrationState {
  final String message;
  const ProfileCreateError({required this.message});
}
