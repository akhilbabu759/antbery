part of '../travel/travelbook_bloc.dart';

sealed class TravelbookState extends Equatable {
  const TravelbookState();
  
  @override
  List<Object> get props => [];
}

final class TravelbookInitial extends TravelbookState {}
class TravelbookLoding extends TravelbookState{}
class TravelbookLoded extends TravelbookState{
  final List<TravelBookEntities> result;

  TravelbookLoded(this.result);
  @override
  List<Object> get props => result;
}
class TravelHomeBookLoadFailure extends TravelbookState{
  final String message;

  const TravelHomeBookLoadFailure(this.message);
  @override
  List<Object> get props => [message];

  
}
