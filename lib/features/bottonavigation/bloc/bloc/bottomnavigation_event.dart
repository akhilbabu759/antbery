part of 'bottomnavigation_bloc.dart';

sealed class BottomnavigationEvent extends Equatable {
  
  const BottomnavigationEvent();

  @override
  List<Object> get props => [];
}
class OnIndexChangeb extends BottomnavigationEvent{
  final int chnagedIndex;

  OnIndexChangeb(this.chnagedIndex);
  @override
   List<Object> get props => [chnagedIndex];
}

