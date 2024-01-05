import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/queue/domian/entities/queue_entities.dart';
import 'package:dartz/dartz.dart';

abstract class QueueRepository{
  Future<Either<Failure,List<QueueEntities>>> getBookList();
}