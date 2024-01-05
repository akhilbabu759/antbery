import 'package:antbery/core/erro/failer.dart';
import 'package:antbery/features/auth/sinup/data/model/signup_model.dart';
import 'package:antbery/features/auth/sinup/domain/entities/signup_enities.dart';
import 'package:antbery/features/home/domain/entities/book_list_entities.dart';
import 'package:dartz/dartz.dart';

abstract class SignupRepository{
  Future<Either<Failure,SignUpEntities>> getSignup(Signupmodel data);
}