import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:dartz/dartz.dart';

abstract class BookListRepository{
  Future<Either<Failure,List<BookListEntities>>> getBookList();

}