part of 'carousel_bloc.dart';

abstract class CarouselState extends Equatable {
  
  const CarouselState();
  
  @override
  List<Object> get props => [];
}
final class CarouselBlocEmpty extends CarouselState{}
class CarouseLoading extends CarouselState{}
class CarouseLoaded extends CarouselState{
  final List<CarouselsEntities> result;

  const CarouseLoaded(this.result);
  @override
  List<Object> get props => result;

  
}

class CarouselLoadFailure extends CarouselState{
  final String message;

  const CarouselLoadFailure(this.message);
  @override
  List<Object> get props => [message];

  
}
