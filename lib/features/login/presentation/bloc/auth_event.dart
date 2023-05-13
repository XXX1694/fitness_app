part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetUserStatus extends AuthEvent {}

class LogIn extends AuthEvent {
  final String username;
  final String password;
  const LogIn({required this.username, required this.password});
}

class LogOut extends AuthEvent {}
