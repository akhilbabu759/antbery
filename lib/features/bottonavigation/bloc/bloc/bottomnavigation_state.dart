part of 'bottomnavigation_bloc.dart';

abstract class BottomnavigationState extends Equatable {
    
  const BottomnavigationState();
  
  @override
  List<Object> get props => [];
}


class BottoLoading extends BottomnavigationState{
 final int bottomIndex;
  BottoLoading(this.bottomIndex);
  @override
  List<Object> get props => [bottomIndex]; 
  
}