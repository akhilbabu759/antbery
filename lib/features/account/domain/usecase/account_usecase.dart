import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/account/domain/entities/account_entities.dart';
import 'package:antbery/features/account/domain/repository/account_repository.dart';
import 'package:dartz/dartz.dart';

class GetAccountUseCase{
  final AccountRepository accountRepository;

  GetAccountUseCase(this.accountRepository);
  Future<Either<Failure,AccountEntities>> execute( ){
    return accountRepository.getSignup();
  }
}