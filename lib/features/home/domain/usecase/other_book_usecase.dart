import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/entities/other_book_entities.dart';
import 'package:antbery/features/home/domain/repositories/financial_repository.dart';
import 'package:antbery/features/home/domain/repositories/other_book_repository.dart';
import 'package:dartz/dartz.dart';

class GetOtherBookListUsecase{
  final OtherBookRepository otherBookRepository;

  GetOtherBookListUsecase(this.otherBookRepository);
  Future<Either<Failure,List<OtherBookEntities>>> execute( ){
    return otherBookRepository.getOtherBookList();
  }

}