part of 'home_books_bloc.dart';

sealed class HomeBooksState extends Equatable {
  const HomeBooksState();
  
  @override
  List<Object> get props => [];
}

final class HomeBooksInitial extends HomeBooksState {}
