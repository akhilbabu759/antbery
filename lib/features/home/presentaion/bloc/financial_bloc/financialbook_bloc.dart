import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/usecase/get_financial_book_list.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'financialbook_event.dart';
part 'financialbook_state.dart';

class FinancialbookBloc extends Bloc<FinancialbookEvent, FinancialbookState> {
  final GetFinancalBookListUsecase financailbook;
  FinancialbookBloc(this.financailbook) : super(FinancialbookInitial()) {
    on<OnFinancialBookget>((event, emit)async {
      final result =await financailbook.execute();
    result.fold((failure) {
      emit(FinancailHomeBookLoadFailure(failure.message));
    }, (data) {
      
      emit(FinancialbookLoded(data));
    });
    
     
    });
  }
}
