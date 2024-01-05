part of 'other_book_bloc.dart';

sealed class OtherBookState extends Equatable {
  const OtherBookState();
  
  @override
  List<Object> get props => [];
}

final class OtherBookInitial extends OtherBookState {}
class OtherbookLoding extends OtherBookState{}
class OtherbookLoded extends OtherBookState{
  final List<OtherBookEntities> result;

  OtherbookLoded(this.result);
  @override
  List<Object> get props => result;

}
class OtherHomeBookLoadFailure extends OtherBookState{
  final String message;

  const OtherHomeBookLoadFailure(this.message);
  @override
  List<Object> get props => [message];

  
}