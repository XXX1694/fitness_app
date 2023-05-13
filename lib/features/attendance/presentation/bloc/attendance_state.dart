import 'package:equatable/equatable.dart';
import 'package:tamos_family_club/features/attendance/data/models/attendance.dart';

class AttendanceState extends Equatable {
  @override
  List<Object> get props => [];
}

class AttendanceCreating extends AttendanceState {}

class AttendanceGetting extends AttendanceState {}

class AttendanceFalse extends AttendanceState {}

class AttendanceTrue extends AttendanceState {}

class AttendanceError extends AttendanceState {
  final String message;

  AttendanceError({required this.message});
}

class AttendanceGot extends AttendanceState {
  final List<Attendance> response;
  final int length;
  AttendanceGot({required this.response, required this.length});
}
