part of 'coach_choose_bloc.dart';

abstract class CoachChooseEvent extends Equatable {
  const CoachChooseEvent();

  @override
  List<Object> get props => [];
}

class GetCoaches extends CoachChooseEvent {}
