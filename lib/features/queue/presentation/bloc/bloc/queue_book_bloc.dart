import 'package:antbery/features/queue/domian/entities/queue_entities.dart';
import 'package:antbery/features/queue/domian/usecase/get_queue_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'queue_book_event.dart';
part 'queue_book_state.dart';

class QueueBookBloc extends Bloc<QueueBookEvent, QueueBookState> {
  final GetQueuUseacse queuUseacse;
  QueueBookBloc(this.queuUseacse) : super(QueueBookInitial()) {
    on<OnQueueGet>((event, emit)async {
       final result =await queuUseacse.execute();
    result.fold((failure) {
      emit(QueueLoadFailure(failure.message));
    }, (data) {
      
      emit(QueueLoaded(data));
    });
    });
  }
}
