part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}
class OnClicked extends SignupEvent{
  final Signupmodel data;

  OnClicked(this.data);
}
