part of '../travel/travelbook_bloc.dart';

sealed class TravelbookEvent extends Equatable {
  const TravelbookEvent();

  @override
  List<Object> get props => [];
}
class OnTravelBookget extends TravelbookEvent{
  const OnTravelBookget();
  @override
   List<Object> get props => [];
}