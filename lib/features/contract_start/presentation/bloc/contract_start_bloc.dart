import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contract_start_event.dart';
part 'contract_start_state.dart';

class ContractStartBloc extends Bloc<ContractStartEvent, ContractStartState> {
  ContractStartBloc() : super(ContractStartInitial()) {
    on<ContractStartEvent>((event, emit) {});
  }
}
