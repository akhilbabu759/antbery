import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselindxChanged(0)) {
    on<OnIndexChange>((event, emit) {
      emit(CarouselindxChanged(event.chnagedIndex));
      
    });
  }
}
