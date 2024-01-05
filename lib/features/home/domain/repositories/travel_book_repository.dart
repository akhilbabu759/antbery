import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/entities/travel_book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TravelBookRepository{
  Future<Either<Failure,List<TravelBookEntities>>> getTravelBookList();
}