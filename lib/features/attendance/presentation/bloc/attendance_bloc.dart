// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:tamos_family_club/features/attendance/data/models/attendance.dart';
import 'package:tamos_family_club/features/attendance/data/repositories/attendance_repository.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_event.dart';
import 'package:tamos_family_club/features/attendance/presentation/bloc/attendance_state.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceBloc extends Bloc<AttendanceEvents, AttendanceState> {
  AttendanceRepository repo;

  AttendanceBloc({required this.repo, required AttendanceState attendanceState})
      : super(AttendanceFalse()) {
    on<AttendanceEnter>(
      (event, emit) async {
        try {
          emit(AttendanceCreating());
          bool data = await repo.clubEnter();
          if (data == true) {
            emit(AttendanceTrue());
          } else {
            emit(AttendanceError(message: "Attandence failed!"));
          }
        } catch (e) {
          if (kDebugMode) {
            print('Error: $e');
          }
          emit(AttendanceError(message: "Attandence failed! $e"));
        }
      },
    );

    on<AttendanceExit>(
      (event, emit) async {
        try {
          emit(AttendanceCreating());
          await repo.clubExit();
          emit(AttendanceTrue());
        } catch (e) {
          if (kDebugMode) {
            print('Error: $e');
          }
          emit(AttendanceError(message: "Attandence failed! $e"));
        }
      },
    );

    on<AttendanceGet>(
      (event, emit) async {
        try {
          emit(AttendanceGetting());
          if (kDebugMode) {
            print('Attandance getting');
          }
          List<Attendance> data = await repo.getAttendance();
          if (kDebugMode) {
            print('Attandance got');
          }
          emit(AttendanceGot(response: data, length: data.length));
        } catch (e) {
          if (kDebugMode) {
            print('Error: $e');
            print('Attandance get error');
          }

          emit(AttendanceError(message: "Attandence get failed! $e"));
        }
      },
    );
    on<AttendanceDone>(
      (event, emit) {
        emit(AttendanceFalse());
      },
    );
  }
}
