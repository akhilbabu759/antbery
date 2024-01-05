part of 'financialbook_bloc.dart';

sealed class FinancialbookState extends Equatable {
  const FinancialbookState();
  
  @override
  List<Object> get props => [];
}

final class FinancialbookInitial extends FinancialbookState {}
class FinancialbookLoding extends FinancialbookState{}
class FinancialbookLoded extends FinancialbookState{
  final List<FinancialBookEntities> result;

  FinancialbookLoded(this.result);
  @override
  List<Object> get props => result;
}
class FinancailHomeBookLoadFailure extends FinancialbookState{
  final String message;

  const FinancailHomeBookLoadFailure(this.message);
  @override
  List<Object> get props => [message];

  
}
