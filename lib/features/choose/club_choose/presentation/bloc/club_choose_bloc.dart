import 'package:equatable/equatable.dart';
import 'package:tamos_family_club/features/choose/club_choose/data/models/club.dart';
import 'package:tamos_family_club/features/choose/club_choose/data/repositories/club_repository.dart';
import 'package:tamos_family_club/services/network_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'club_choose_event.dart';
part 'club_choose_state.dart';

class ClubChooseBloc extends Bloc<ClubChooseEvent, ClubChooseState> {
  final networkInfo = NetworkInfo();
  ClubRepository repo;
  ClubChooseBloc({
    required this.repo,
    required ClubChooseState clubsState,
  }) : super(ClubChooseInitial()) {
    on<GetClubs>(
      (event, emit) async {
        emit(ClubsGetting());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          if (kDebugMode) {
            print('GetBranch: No internet connection');
          }
          emit(ConnectionError());
        } else {
          try {
            List<Club> res = await repo.getClubList();
            if (kDebugMode) {
              print('Get Branch: Success');
            }
            emit(ClubGot(clubList: res));
          } catch (e) {
            if (kDebugMode) {
              print('Get Branch: $e');
            }
            emit(ClubGettingError(message: e.toString()));
          }
        }
      },
    );

    on<SetClub>(
      (event, emit) async {
        repo.setClub(event.clubId);
      },
    );
  }
}
