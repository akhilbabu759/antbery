import 'package:antbery/features/home/domain/entities/other_book_entities.dart';
import 'package:antbery/features/home/domain/usecase/other_book_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'other_book_event.dart';
part 'other_book_state.dart';

class OtherBookBloc extends Bloc<OtherBookEvent, OtherBookState> {
  final GetOtherBookListUsecase Otherbooh;
  OtherBookBloc(this.Otherbooh) : super(OtherBookInitial()) {
    on<OnOtherBookget>((event, emit) async{
      final result =await Otherbooh.execute();
    result.fold((failure) {
      emit(OtherHomeBookLoadFailure(failure.message));
    }, (data) {
      
      emit(OtherbookLoded(data));
    });
      
    });
  }
}
