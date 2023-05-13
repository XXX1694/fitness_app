part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangePassword extends ChangePasswordEvent {
  final String currentPass;
  final String newPass;
  const ChangePassword({required this.currentPass, required this.newPass});
}
