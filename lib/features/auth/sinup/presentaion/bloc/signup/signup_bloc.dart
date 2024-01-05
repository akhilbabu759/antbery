import 'package:antbery/features/auth/sinup/data/model/signup_model.dart';
import 'package:antbery/features/auth/sinup/domain/entities/signup_enities.dart';
import 'package:antbery/features/auth/sinup/domain/usecase/get_signup_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final GetSignupUseCase signupUseCase;
  SignupBloc(this.signupUseCase) : super(SignupInitial()) {
    on<OnClicked>((event, emit) async{
       final result =await signupUseCase.execute(event.data);
    result.fold((failure) {
      emit(SignupFailure(failure.message));
    }, (data) {
      
      emit(SinupClicked(data));
    });
      
    });
  }
}
