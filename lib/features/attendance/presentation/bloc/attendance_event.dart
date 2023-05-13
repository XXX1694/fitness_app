import 'package:equatable/equatable.dart';

class AttendanceEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class AttendanceEnter extends AttendanceEvents {}

class AttendanceExit extends AttendanceEvents {}

class AttendanceGet extends AttendanceEvents {}

class AttendanceDone extends AttendanceEvents {}
