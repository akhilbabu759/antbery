import 'package:antbery/features/account/domain/entities/account_entities.dart';
import 'package:antbery/features/account/domain/usecase/account_usecase.dart';
import 'package:antbery/features/auth/sinup/presentaion/bloc/image_pic/image_pick_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'accountdetails_event.dart';
part 'accountdetails_state.dart';

class AccountdetailsBloc extends Bloc<AccountdetailsEvent, AccountdetailsState> {
  final GetAccountUseCase accountUseCase;
  AccountdetailsBloc(this.accountUseCase) : super(AccountLoding()) {
    on<OnValueChaneg>((event, emit) async{
      emit(AccountLoding());
      final result =await accountUseCase.execute();
      result.fold((failure){emit(AccountFetchFailure(failure.message));} ,(data) => emit(AccountLodied(data)));
      
    });
  }
}
