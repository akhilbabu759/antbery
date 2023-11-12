part of 'carousel_bloc.dart';

abstract class CarouselState extends Equatable {
  const CarouselState();
  
  @override
  List<Object> get props => [];
}

// final class CarouselInitial extends CarouselState {}
class CarouselindxChanged extends CarouselState{
  final int indexChange;

  CarouselindxChanged(this.indexChange);
  @override
  List<Object> get props => [indexChange];
}
