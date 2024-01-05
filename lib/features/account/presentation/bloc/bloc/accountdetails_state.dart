part of 'accountdetails_bloc.dart';

sealed class AccountdetailsState extends Equatable {
  const AccountdetailsState();
  
  @override
  List<Object> get props => [];
}

final class AccountdetailsInitial extends AccountdetailsState {}
class AccountLoding extends AccountdetailsState{}
class AccountLodied extends AccountdetailsState{
  final AccountEntities data;

  AccountLodied(this.data);
  List<AccountEntities> get props => [data];
}
class AccountFetchFailure extends AccountdetailsState {
  final String message;

  const AccountFetchFailure(this.message);
  @override
  List<Object> get props => [message];
}
