import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_books_event.dart';
part 'home_books_state.dart';

class HomeBooksBloc extends Bloc<HomeBooksEvent, HomeBooksState> {
  HomeBooksBloc() : super(HomeBooksInitial()) {
    on<HomeBooksEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
