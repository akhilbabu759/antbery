import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottomnavigation_event.dart';
part 'bottomnavigation_state.dart';

class BottomnavigationBloc extends Bloc<BottomnavigationEvent, BottomnavigationState> {
  BottomnavigationBloc() : super(BottoLoading(0)) {
    on<OnIndexChangeb>((event, emit) {
      emit(BottoLoading(event.chnagedIndex));
    });
  }
}
