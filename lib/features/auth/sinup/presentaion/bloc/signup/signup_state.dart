part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

class SinupClicked extends SignupState {
  final SignUpEntities data;

  SinupClicked(this.data);
  List<SignUpEntities> get props => [data];
}

class SignupFailure extends SignupState {
  final String message;

  const SignupFailure(this.message);
  @override
  List<Object> get props => [message];
}
