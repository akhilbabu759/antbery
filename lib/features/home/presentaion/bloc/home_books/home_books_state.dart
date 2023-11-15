part of 'home_books_bloc.dart';

sealed class HomeBooksState extends Equatable {
  const HomeBooksState();
  
  @override
  List<Object> get props => [];
}

final class HomeBookBlocEmpty extends HomeBooksState{}
class HommeBookLoading extends HomeBooksState{}
class HomeBookLoaded extends HomeBooksState{
  final List<BookListEntities> result;

  const HomeBookLoaded(this.result);
  @override
  List<Object> get props => result;

  
}
class HomeBookLoadFailure extends HomeBooksState{
  final String message;

  const HomeBookLoadFailure(this.message);
  @override
  List<Object> get props => [message];

  
}
