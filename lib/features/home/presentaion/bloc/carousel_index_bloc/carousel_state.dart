part of 'carousel_bloc.dart';

abstract class CarouseIndexlState extends Equatable {
  const CarouseIndexlState();
  
  @override
  List<Object> get props => [];
}



class CarouselindxChanged extends CarouseIndexlState{
  final int indexChange;

  CarouselindxChanged(this.indexChange);
  @override
  List<Object> get props => [indexChange];
}


