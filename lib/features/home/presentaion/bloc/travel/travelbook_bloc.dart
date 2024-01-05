import 'package:antbery/features/home/domain/entities/travel_book_entity.dart';
import 'package:antbery/features/home/domain/usecase/travel_book_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'travelbook_event.dart';
part 'travelbook_state.dart';

class TravelbookBloc extends Bloc<TravelbookEvent, TravelbookState> {
  final GetTravelBookListUsecase travelBook;
  TravelbookBloc(this.travelBook) : super(TravelbookInitial()) {
    on<OnTravelBookget>((event, emit)async {
      final result =await travelBook.execute();
    result.fold((failure) {
      emit(TravelHomeBookLoadFailure(failure.message));
    }, (data) {
      
      emit(TravelbookLoded(data));
    });
    });
  }
}
