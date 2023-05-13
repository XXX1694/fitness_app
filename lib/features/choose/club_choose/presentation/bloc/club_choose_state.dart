part of 'club_choose_bloc.dart';

class ClubChooseState extends Equatable {
  const ClubChooseState();

  @override
  List<Object> get props => [];
}

class ClubChooseInitial extends ClubChooseState {}

class ClubGot extends ClubChooseState {
  final List<Club> clubList;
  const ClubGot({required this.clubList});
}

class ClubSet extends ClubChooseState {}

class ClubsGetting extends ClubChooseState {}

class ClubSetting extends ClubChooseState {}

class ConnectionError extends ClubChooseState {}

class ClubGettingError extends ClubChooseState {
  final String message;
  const ClubGettingError({required this.message});
}

class ClubSettingError extends ClubChooseState {
  final String message;
  const ClubSettingError({required this.message});
}
