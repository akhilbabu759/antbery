part of 'home_books_bloc.dart';

sealed class HomeBooksEvent extends Equatable {
  const HomeBooksEvent();

  @override
  List<Object> get props => [];
}
class OnBookget extends HomeBooksEvent{
  const OnBookget();
  @override
   List<Object> get props => [];
}
