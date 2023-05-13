part of 'coach_bloc.dart';

class CoachInfoState extends Equatable {
  const CoachInfoState();

  @override
  List<Object> get props => [];
}

class CoachInitial extends CoachInfoState {}

class CoachInfoGot extends CoachInfoState {
  final CoachInfoModel coach;
  const CoachInfoGot({required this.coach});
}

class CoachInfoGetting extends CoachInfoState {}

class ConnectionError extends CoachInfoState {}

class CoachInfoGettingError extends CoachInfoState {
  final String message;
  const CoachInfoGettingError({required this.message});
}
