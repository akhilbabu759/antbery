

import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/queue/domian/entities/queue_entities.dart';
import 'package:antbery/features/queue/domian/repositoris/queue_repository.dart';
import 'package:dartz/dartz.dart';

class GetQueuUseacse{
  final QueueRepository queueRepository;

  GetQueuUseacse(this.queueRepository);
   Future<Either<Failure,List<QueueEntities>>> execute( ){
    return queueRepository.getBookList();
  }
}