part of 'coach_bloc.dart';

abstract class CoachInfoEvent extends Equatable {
  const CoachInfoEvent();

  @override
  List<Object> get props => [];
}

class GetCoachInfo extends CoachInfoEvent {
  final int coahcId;
  const GetCoachInfo({required this.coahcId});
}
