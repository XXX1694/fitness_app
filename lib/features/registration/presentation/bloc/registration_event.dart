part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class CreateUser extends RegistrationEvent {
  final String username;
  final String password;
  const CreateUser({required this.username, required this.password});
}

class CreateProfile extends RegistrationEvent {
  final String firstName;
  final String lastName;
  final String birthDate;
  final String phoneNumber;
  final String email;

  const CreateProfile({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.phoneNumber,
    required this.email,
  });
}
