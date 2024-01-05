import 'dart:io';

import 'package:antbery/core/erro/exception.dart';
import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/account/domain/repository/account_repository.dart';
import 'package:antbery/features/queue/data/data_source/remote/queue_remote_data.dart';
import 'package:antbery/features/queue/domian/entities/queue_entities.dart';
import 'package:antbery/features/queue/domian/repositoris/queue_repository.dart';
import 'package:dartz/dartz.dart';

class QueueRepositoryImpl extends QueueRepository{
  final QueueRemoteDataSource queueRemoteDataSource;

  QueueRepositoryImpl({required this.queueRemoteDataSource});

  @override
  Future<Either<Failure, List<QueueEntities>>> getBookList()async {
    try{
      final result = await queueRemoteDataSource.getBookList();
      return Right(result!);
    } on ServerException{
      return const Left(ServerFailer('An error has occurred'));
    }on SocketException{
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
 
}}