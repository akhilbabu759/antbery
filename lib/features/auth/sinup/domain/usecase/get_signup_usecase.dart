import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/auth/sinup/data/model/signup_model.dart';
import 'package:antbery/features/auth/sinup/domain/entities/signup_enities.dart';
import 'package:antbery/features/auth/sinup/domain/repository/signup_repository.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:dartz/dartz.dart';

class GetSignupUseCase{
  final SignupRepository signupRepository;

  GetSignupUseCase(this.signupRepository);
  Future<Either<Failure,SignUpEntities>> execute(Signupmodel data ){
    return signupRepository.getSignup(data);
  }
}