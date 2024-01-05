import 'package:antbery/features/home/domain/entities/self_help_book_entities.dart';
import 'package:antbery/features/home/domain/usecase/self_book_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'self_book_event.dart';
part 'self_book_state.dart';

class SelfBookBloc extends Bloc<SelfBookEvent, SelfBookState> {
  final GetSelfBookListUsecase selfBook;
  SelfBookBloc(this.selfBook) : super(SelfBookInitial()) {
    on<OnSelfBookget>((event, emit)async {
        final result =await selfBook.execute();
    result.fold((failure) {
      emit(SelfHomeBookLoadFailure(failure.message));
    }, (data) {
      
      emit(SelfbookLoded(data));
    });
    });
  }
}
