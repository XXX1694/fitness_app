import 'package:equatable/equatable.dart';
import 'package:tamos_family_club/features/choose/coach_choose/data/models/coach.dart';
import 'package:tamos_family_club/features/choose/coach_choose/data/repositories/coah_repository.dart';
import 'package:tamos_family_club/services/network_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coach_choose_event.dart';
part 'coach_choose_state.dart';

class CoachChooseBloc extends Bloc<CoachChooseEvent, CoachChooseState> {
  final networkInfo = NetworkInfo();
  CoachRepository repo;
  CoachChooseBloc({
    required this.repo,
    required CoachChooseState clubsState,
  }) : super(CoachChooseInitial()) {
    on<GetCoaches>((event, emit) async {
      emit(CoachesGetting());
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        if (kDebugMode) {
          print('Get Coaches: No internet connection');
        }
        emit(ConnectionError());
      } else {
        try {
          List<Coach> res = await repo.getCoachesList();
          if (kDebugMode) {
            print('Get Coaches: Success');
          }
          emit(CoachesGot(coachList: res));
        } catch (e) {
          if (kDebugMode) {
            print('Get Coaches: $e');
          }
          emit(CoachesGettingError(message: e.toString()));
        }
      }
    });
  }
}
