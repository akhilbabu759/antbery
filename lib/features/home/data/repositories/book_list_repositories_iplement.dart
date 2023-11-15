import 'dart:io';

import 'package:antbery/core/erro/exception.dart';
import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/data/data_source/remote/book_list_data_source.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:antbery/features/home/domain/repositories/book_list_repositories.dart';
import 'package:dartz/dartz.dart';

class BookListRepositoryImpl extends BookListRepository{
  final BookListRemoteDataSource bookListRemoteDataSource;

  BookListRepositoryImpl({required this.bookListRemoteDataSource});

  @override
  Future<Either<Failure, List<BookListEntities>>> getBookList() async{
    try{
      final result = await bookListRemoteDataSource.getBookList();
      return Right(result);
    } on ServerException{
      return const Left(ServerFailer('An error has occurred'));
    }on SocketException{
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
   
  }
}