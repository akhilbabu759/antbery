import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/entities/travel_book_entity.dart';
import 'package:antbery/features/home/domain/repositories/financial_repository.dart';
import 'package:antbery/features/home/domain/repositories/travel_book_repository.dart';
import 'package:dartz/dartz.dart';

class GetTravelBookListUsecase{
  final TravelBookRepository travelBookRepository;

  GetTravelBookListUsecase(this.travelBookRepository);
  Future<Either<Failure,List<TravelBookEntities>>> execute( ){
    return travelBookRepository.getTravelBookList();
  }

}