import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/entities/self_help_book_entities.dart';
import 'package:dartz/dartz.dart';

abstract class SelfHelpBookRepository{
  Future<Either<Failure,List<SelfBookEntities>>> getSelfHelpBookList();
}