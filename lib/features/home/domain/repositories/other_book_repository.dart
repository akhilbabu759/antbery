import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/entities/other_book_entities.dart';
import 'package:dartz/dartz.dart';

abstract class OtherBookRepository{
  Future<Either<Failure,List<OtherBookEntities>>> getOtherBookList();
}