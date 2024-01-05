import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:dartz/dartz.dart';

abstract class FinacialBookRepository{
  Future<Either<Failure,List<FinancialBookEntities>>> getFinancalBookList();
}