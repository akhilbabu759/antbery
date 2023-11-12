part of 'carousel_bloc.dart';

sealed class CarouselEvent extends Equatable {
  const CarouselEvent();

  @override
  List<Object> get props => [];
}
class OnIndexChange extends CarouselEvent{
  final int chnagedIndex;

  OnIndexChange(this.chnagedIndex);
  @override
   List<Object> get props => [chnagedIndex];
}
