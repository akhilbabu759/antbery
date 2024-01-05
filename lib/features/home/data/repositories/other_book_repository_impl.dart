import 'dart:io';

import 'package:antbery/core/erro/exception.dart';
import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/data/data_source/remote/financial_data_source.dart';
import 'package:antbery/features/home/data/data_source/remote/other_book_data_source.dart';
import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/entities/other_book_entities.dart';
import 'package:antbery/features/home/domain/repositories/financial_repository.dart';
import 'package:antbery/features/home/domain/repositories/other_book_repository.dart';
import 'package:antbery/features/home/domain/usecase/other_book_usecase.dart';
import 'package:dartz/dartz.dart';

class OtherBookListRepositoryIpl extends OtherBookRepository{
  final OtherBookListRemoteDataSource otherBookListRemoteDataSource;

  OtherBookListRepositoryIpl({required this.otherBookListRemoteDataSource});

  @override
  Future<Either<Failure, List<OtherBookEntities>>> getOtherBookList()async {
    try{
      final result = await otherBookListRemoteDataSource.getBookList();
      return Right(result);
    } on ServerException{
      return const Left(ServerFailer('An error has occurred'));
    }on SocketException{
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
   
  }
  
  
}