part of 'queue_book_bloc.dart';

sealed class QueueBookState extends Equatable {
  const QueueBookState();
  
  @override
  List<Object> get props => [];
}

final class QueueBookInitial extends QueueBookState {}
class QueueLoading extends QueueBookState{}
class QueueLoaded extends QueueBookState{
  final List<QueueEntities> result;

  const QueueLoaded(this.result);
  @override
  List<Object> get props => result;

  
}
class QueueLoadFailure extends QueueBookState{
  final String message;

  const QueueLoadFailure(this.message);
  @override
  List<Object> get props => [message];

  
}
