import 'dart:io';

import 'package:antbery/core/erro/exception.dart';
import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/auth/sinup/data/data_source/remote/remote_data_source.dart';
import 'package:antbery/features/auth/sinup/data/model/signup_model.dart';
import 'package:antbery/features/auth/sinup/domain/entities/signup_enities.dart';
import 'package:antbery/features/auth/sinup/domain/repository/signup_repository.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:dartz/dartz.dart';

class SignupRepositoryImpl extends SignupRepository{
  final SignupRemoteDataSource signupRemoteDataSource;

  SignupRepositoryImpl({required this.signupRemoteDataSource});

  @override
  Future<Either<Failure, SignUpEntities>> getSignup(Signupmodel data)async {
     try{
      final result = await signupRemoteDataSource.getSignup(data);
      return Right(result);
    } on ServerException{
      return const Left(ServerFailer('An error has occurred'));
    }on SocketException{
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
    
  }
}