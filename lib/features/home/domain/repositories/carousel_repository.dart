import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/home/domain/entities/carousel_entities.dart';
import 'package:dartz/dartz.dart';

abstract class CarouselRepository{
  Future<Either<Failure,CarouselsEntities>> getCarousels();

}