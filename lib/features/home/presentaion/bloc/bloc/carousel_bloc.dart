import 'package:antbery/features/home/domain/entities/carousel_entities.dart';
import 'package:antbery/features/home/domain/usecase/get_carousel.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
    final GetCarouselsUseacse _carouselsUseacse;
  CarouselBloc(this._carouselsUseacse) : super(CarouseLoading()) {
    on<OnValueGethanged>((event, emit) async{
      emit(CarouseLoading());
      final result =await _carouselsUseacse.execute();
      result.fold((failure){emit(CarouselLoadFailure(failure.message));} ,(data) => emit(CarouseLoaded(data)));
      
    },);
  }
}
