import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:antbery/features/home/domain/usecase/get_book_list.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_books_event.dart';
part 'home_books_state.dart';

class HomeBooksBloc extends Bloc<HomeBooksEvent, HomeBooksState> {
  final GetBookListUseacse _bookListUseacse;
  HomeBooksBloc(this._bookListUseacse) : super(HommeBookLoading()) {
    on<OnBookget>((event, emit)async {
    final result =await _bookListUseacse.execute();
    result.fold((failure) {
      emit(HomeBookLoadFailure(failure.message));
    }, (data) {
      emit(HomeBookLoaded(data));
    });
    });
  }
}
