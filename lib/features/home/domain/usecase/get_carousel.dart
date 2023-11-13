import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/carousel_entities.dart';
import 'package:antbery/features/home/domain/repositories/carousel_repository.dart';
import 'package:dartz/dartz.dart';

class GetCarouselsUseacse{
  final CarouselRepository carouselRepository;

  GetCarouselsUseacse(this.carouselRepository);
   Future<Either<Failure,CarouselsEntities>> execute( ){
    return carouselRepository.getCarousels();
  }
}