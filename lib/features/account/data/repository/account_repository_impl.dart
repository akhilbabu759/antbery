import 'dart:io';

import 'package:antbery/core/erro/exception.dart';
import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/account/data/data_source/remote_data_source.dart';
import 'package:antbery/features/account/domain/entities/account_entities.dart';
import 'package:antbery/features/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class AccountRepositoryImpl extends AccountRepository{
  final AccountRemoteDataSource accountRemoteDataSource;

  AccountRepositoryImpl({required this.accountRemoteDataSource});

  @override
  Future<Either<Failure, AccountEntities>> getSignup()async {
     try{
      final result = await accountRemoteDataSource.getSignup();
      return Right(result!);
    } on ServerException{
      return const Left(ServerFailer('An error has occurred'));
    }on SocketException{
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
    
  }
}