import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:antbery/features/home/domain/repositories/book_list_repositories.dart';
import 'package:dartz/dartz.dart';

class GetBookListUseacse{
  final BookListRepository booklistRepositories;

  GetBookListUseacse(this.booklistRepositories);
   Future<Either<Failure,List<BookListEntities>>> execute( ){
    return booklistRepositories.getBookList();
  }
}