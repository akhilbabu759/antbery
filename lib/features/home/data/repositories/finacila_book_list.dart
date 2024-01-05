import 'dart:io';

import 'package:antbery/core/erro/exception.dart';
import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/data/data_source/remote/financial_data_source.dart';
import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/repositories/financial_repository.dart';
import 'package:dartz/dartz.dart';

class FinancialBookListRepositoryIpl extends FinacialBookRepository{
  final FinancialBookListRemoteDataSource financialBookListRemoteDataSource;

  FinancialBookListRepositoryIpl({required this.financialBookListRemoteDataSource});

  @override
  Future<Either<Failure, List<FinancialBookEntities>>> getFinancalBookList()async {
    try{
      final result = await financialBookListRemoteDataSource.getBookList();
      return Right(result);
    } on ServerException{
      return const Left(ServerFailer('An error has occurred'));
    }on SocketException{
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
   
  }
  
}