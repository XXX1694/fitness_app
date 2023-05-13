part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class UserOffline extends AuthState {}

class UserLoading extends AuthState {}

class UserOnline extends AuthState {}

class ConnectionError extends AuthState {}

class UserLogError extends AuthState {
  final String message;
  const UserLogError({required this.message});
}
