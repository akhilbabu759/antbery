import 'package:antbery/features/home/domain/entities/carousel_entities.dart';
import 'package:antbery/features/home/domain/usecase/get_carousel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_state.dart';
import 'package:equatable/equatable.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselIndexBloc extends Bloc<CarouseIndexlEvent, CarouseIndexlState> {

  CarouselIndexBloc() : super(CarouselindxChanged(0)) {
    on<OnIndexChange>((event, emit) {
      emit(CarouselindxChanged(event.chnagedIndex));
      
    });
    
  }
}
