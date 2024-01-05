part of 'queue_book_bloc.dart';

sealed class QueueBookEvent extends Equatable {
  const QueueBookEvent();

  @override
  List<Object> get props => [];
}
class OnQueueGet extends QueueBookEvent{
  const OnQueueGet();
  @override
   List<Object> get props => [];
}
