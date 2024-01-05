import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/entities/self_help_book_entities.dart';
import 'package:antbery/features/home/domain/repositories/financial_repository.dart';
import 'package:antbery/features/home/domain/repositories/self_help_book_repository.dart';
import 'package:dartz/dartz.dart';

class GetSelfBookListUsecase{
  final SelfHelpBookRepository selfBookRepository;

  GetSelfBookListUsecase(this.selfBookRepository);
  Future<Either<Failure,List<SelfBookEntities>>> execute( ){
    return selfBookRepository.getSelfHelpBookList();
  }

}