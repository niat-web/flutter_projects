import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    // Handle Increment Event
    on<IncrementEvent>((event, emit) {
      // If current state is CounterValueState → increase counter
      if (state is CounterValueState) {
        final currentValue = (state as CounterValueState).counter;
        emit(CounterValueState(currentValue + 1));
      } else {
        // If initial, start from 1
        emit(const CounterValueState(1));
      }
    });

    // Handle Decrement Event
    on<DecrementEvent>((event, emit) {
      if (state is CounterValueState) {
        final currentValue = (state as CounterValueState).counter;
        emit(CounterValueState(currentValue - 1));
      } else {
        // If initial, start from -1
        emit(const CounterValueState(-1));
      }
    });
  }
}

