part of 'carousel_bloc.dart';

sealed class CarouseIndexlEvent extends Equatable {
  const CarouseIndexlEvent();

  @override
  List<Object> get props => [];
}
class OnIndexChange extends CarouseIndexlEvent{
  final int chnagedIndex;

  OnIndexChange(this.chnagedIndex);
  @override
   List<Object> get props => [chnagedIndex];
}
