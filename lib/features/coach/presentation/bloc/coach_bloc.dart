import 'package:equatable/equatable.dart';
import 'package:tamos_family_club/features/coach/data/models/coach_info.dart';
import 'package:tamos_family_club/features/coach/data/repositories/coach_repository.dart';

import 'package:tamos_family_club/services/network_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coach_event.dart';
part 'coach_state.dart';

class CoachInfoBloc extends Bloc<CoachInfoEvent, CoachInfoState> {
  final networkInfo = NetworkInfo();
  CoachInfoRepository repo;
  CoachInfoBloc({
    required this.repo,
    required CoachInfoState coachState,
  }) : super(CoachInitial()) {
    on<GetCoachInfo>((event, emit) async {
      emit(CoachInfoGetting());
      final isConnected = await networkInfo.isConnected();
      if (!isConnected) {
        if (kDebugMode) {
          print('Get Coaches: No internet connection');
        }
        emit(ConnectionError());
      } else {
        try {
          final res = await repo.getCoachInfo(event.coahcId);
          if (kDebugMode) {
            print('Get Coache Info: Success');
          }
          emit(CoachInfoGot(coach: res));
        } catch (e) {
          if (kDebugMode) {
            print('Get Coache Error: $e');
          }
          emit(CoachInfoGettingError(message: e.toString()));
        }
      }
    });
  }
}
