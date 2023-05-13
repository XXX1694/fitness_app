import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coach_list_event.dart';
part 'coach_list_state.dart';

class CoachListBloc extends Bloc<CoachListEvent, CoachListState> {
  CoachListBloc() : super(CoachListInitial()) {
    on<CoachListEvent>((event, emit) {});
  }
}
