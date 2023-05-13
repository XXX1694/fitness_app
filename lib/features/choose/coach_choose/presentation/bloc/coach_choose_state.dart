part of 'coach_choose_bloc.dart';

class CoachChooseState extends Equatable {
  const CoachChooseState();

  @override
  List<Object> get props => [];
}

class CoachChooseInitial extends CoachChooseState {}

class CoachesGot extends CoachChooseState {
  final List<Coach> coachList;
  const CoachesGot({required this.coachList});
}

class CoachesGetting extends CoachChooseState {}

class ConnectionError extends CoachChooseState {}

class CoachesGettingError extends CoachChooseState {
  final String message;
  const CoachesGettingError({required this.message});
}
