import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/account/domain/entities/account_entities.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepository{
  Future<Either<Failure,AccountEntities>> getSignup();
}