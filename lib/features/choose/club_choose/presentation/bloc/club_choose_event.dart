part of 'club_choose_bloc.dart';

abstract class ClubChooseEvent extends Equatable {
  const ClubChooseEvent();

  @override
  List<Object> get props => [];
}

class GetClubs extends ClubChooseEvent {}

class SetClub extends ClubChooseEvent {
  final int clubId;
  const SetClub({required this.clubId});
}
