import 'dart:io';

import 'package:antbery/core/erro/exception.dart';
import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/data/data_source/remote/carousel_data_sourece.dart';
import 'package:antbery/features/home/domain/entities/carousel_entities.dart';
import 'package:antbery/features/home/domain/repositories/carousel_repository.dart';
import 'package:dartz/dartz.dart';

class CarouselRepositoriesImpl extends CarouselRepository{
  final CarouselRemoteDataSource carouselRemoteDataSource;

  CarouselRepositoriesImpl({required this.carouselRemoteDataSource});

  @override
  Future<Either<Failure, List<CarouselsEntities>>> getCarousels()async {
    try{
      final result = await carouselRemoteDataSource.getCarousels();
      return Right(result);
    } on ServerException{
      return const Left(ServerFailer('An error has occurred'));
    }on SocketException{
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}