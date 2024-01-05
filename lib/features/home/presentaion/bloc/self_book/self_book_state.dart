part of 'self_book_bloc.dart';

sealed class SelfBookState extends Equatable {
  const SelfBookState();
  
  @override
  List<Object> get props => [];
}

final class SelfBookInitial extends SelfBookState {}
class SelfbookLoding extends SelfBookState{}
class SelfbookLoded extends SelfBookState{
  final List<SelfBookEntities> result;

  SelfbookLoded(this.result);
  @override
  List<Object> get props => result;
}
class SelfHomeBookLoadFailure extends SelfBookState{
  final String message;

  const SelfHomeBookLoadFailure(this.message);
  @override
  List<Object> get props => [message];

  
}
