import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/repositories/financial_repository.dart';
import 'package:dartz/dartz.dart';

class GetFinancalBookListUsecase{
  final FinacialBookRepository finacialBookRepository;

  GetFinancalBookListUsecase(this.finacialBookRepository);
  Future<Either<Failure,List<FinancialBookEntities>>> execute( ){
    return finacialBookRepository.getFinancalBookList();
  }

}