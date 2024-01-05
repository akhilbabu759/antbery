import 'package:antbery/config/them/blue_edge_style.dart';
import 'package:antbery/features/account/data/data_source/remote_data_source.dart';
import 'package:antbery/features/account/data/repository/account_repository_impl.dart';
import 'package:antbery/features/account/domain/repository/account_repository.dart';
import 'package:antbery/features/account/domain/usecase/account_usecase.dart';
import 'package:antbery/features/account/presentation/bloc/bloc/accountdetails_bloc.dart';
import 'package:antbery/features/auth/sinup/data/data_source/remote/remote_data_source.dart';
import 'package:antbery/features/auth/sinup/data/repositories/signup_repositories_impl.dart';
import 'package:antbery/features/auth/sinup/domain/repository/signup_repository.dart';
import 'package:antbery/features/auth/sinup/domain/usecase/get_signup_usecase.dart';

import 'package:antbery/features/auth/sinup/presentaion/bloc/image_pic/image_pick_bloc.dart';
import 'package:antbery/features/auth/sinup/presentaion/bloc/signup/signup_bloc.dart';
import 'package:antbery/features/bottonavigation/bloc/bloc/bottomnavigation_bloc.dart';
import 'package:antbery/features/home/data/data_source/remote/book_list_data_source.dart';
import 'package:antbery/features/home/data/data_source/remote/carousel_data_sourece.dart';
import 'package:antbery/features/home/data/data_source/remote/financial_data_source.dart';
import 'package:antbery/features/home/data/data_source/remote/other_book_data_source.dart';
import 'package:antbery/features/home/data/data_source/remote/self_book_data_source.dart';
import 'package:antbery/features/home/data/data_source/remote/travel_data_source.dart';
import 'package:antbery/features/home/data/repositories/book_list_repositories_iplement.dart';
import 'package:antbery/features/home/data/repositories/carousel_repository_implement.dart';
import 'package:antbery/features/home/data/repositories/finacila_book_list.dart';
import 'package:antbery/features/home/data/repositories/other_book_repository_impl.dart';
import 'package:antbery/features/home/data/repositories/self_book_repository_impl.dart';
import 'package:antbery/features/home/data/repositories/travel_book_repository_impl.dart';
import 'package:antbery/features/home/domain/repositories/book_list_repositories.dart';
import 'package:antbery/features/home/domain/repositories/carousel_repository.dart';
import 'package:antbery/features/home/domain/repositories/financial_repository.dart';
import 'package:antbery/features/home/domain/repositories/other_book_repository.dart';
import 'package:antbery/features/home/domain/repositories/self_help_book_repository.dart';
import 'package:antbery/features/home/domain/repositories/travel_book_repository.dart';
import 'package:antbery/features/home/domain/usecase/get_book_list.dart';
import 'package:antbery/features/home/domain/usecase/get_carousel.dart';
import 'package:antbery/features/home/domain/usecase/get_financial_book_list.dart';
import 'package:antbery/features/home/domain/usecase/other_book_usecase.dart';
import 'package:antbery/features/home/domain/usecase/self_book_usecase.dart';
import 'package:antbery/features/home/domain/usecase/travel_book_usecase.dart';
import 'package:antbery/features/home/presentaion/bloc/carousel/carousel_bloc.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel_index_bloc/carousel_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/financial_bloc/financialbook_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/other_book/other_book_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/self_book/self_book_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/travel/travelbook_bloc.dart';
import 'package:antbery/features/queue/data/data_source/remote/queue_remote_data.dart';
import 'package:antbery/features/queue/data/repositories/queue_repo_impl.dart';
import 'package:antbery/features/queue/domian/repositoris/queue_repository.dart';
import 'package:antbery/features/queue/domian/usecase/get_queue_usecase.dart';
import 'package:antbery/features/queue/presentation/bloc/bloc/queue_book_bloc.dart';

import 'package:get_it/get_it.dart';

import 'config/them/pro_black.dart';

final GetIt locator = GetIt.instance;
void setUpLocator() {
  locator.registerFactory(() => CarouselBloc(locator()));
  locator.registerFactory(() => CarouselIndexBloc());
  locator.registerSingleton(() => ProBlackStyle());
  locator.registerSingleton(() => BlueEdgeStryle());

  locator.registerLazySingleton(() => GetCarouselsUseacse(locator()));
  locator.registerLazySingleton<CarouselRepository>(
      () => CarouselRepositoriesImpl(carouselRemoteDataSource: locator()));
  locator.registerLazySingleton<CarouselRemoteDataSource>(
      () => CarouselRemoteDataSourceImpl());
  locator.registerFactory(() => HomeBooksBloc(locator()));
  locator.registerLazySingleton(() => GetBookListUseacse(locator()));
  locator.registerLazySingleton<BookListRepository>(
      () => BookListRepositoryImpl(bookListRemoteDataSource: locator()));
  locator.registerLazySingleton<BookListRemoteDataSource>(
      () => BookListRemoteDataSourceImpl());
  locator.registerFactory(() => BottomnavigationBloc());

//financialList
  locator.registerFactory(() => FinancialbookBloc(locator()));
  locator.registerLazySingleton(() => GetFinancalBookListUsecase(locator()));
  locator.registerLazySingleton<FinacialBookRepository>(() =>
      FinancialBookListRepositoryIpl(
          financialBookListRemoteDataSource: locator()));
  locator.registerLazySingleton<FinancialBookListRemoteDataSource>(
      () => FinancialBookListRemoteDataSourceImpl());

//Otherlist
  locator.registerFactory(() => OtherBookBloc(locator()));
  locator.registerLazySingleton(() => GetOtherBookListUsecase(locator()));
  locator.registerLazySingleton<OtherBookRepository>(() =>
      OtherBookListRepositoryIpl(otherBookListRemoteDataSource: locator()));
  locator.registerLazySingleton<OtherBookListRemoteDataSource>(
      () => OtherBookListRemoteDataSourceImpl());

//selflist
  locator.registerFactory(() => SelfBookBloc(locator()));
  locator.registerLazySingleton(() => GetSelfBookListUsecase(locator()));
  locator.registerLazySingleton<SelfHelpBookRepository>(
      () => SelfBookListRepositoryIpl(selfBookListRemoteDataSource: locator()));
  locator.registerLazySingleton<SelfBookListRemoteDataSource>(
      () => SelfBookListRemoteDataSourceImpl());

//TravelList
  locator.registerFactory(() => TravelbookBloc(locator()));
  locator.registerLazySingleton(() => GetTravelBookListUsecase(locator()));
  locator.registerLazySingleton<TravelBookRepository>(() =>
      TravelBookListRepositoryIpl(travelBookListRemoteDataSource: locator()));
  locator.registerLazySingleton<TraveBookListRemoteDataSource>(
      () => TravelBookListRemoteDataSourceImpl());

  locator.registerFactory(() => ImagePickBloc());
////signup
  locator.registerFactory(() => SignupBloc(locator()));
  locator.registerLazySingleton(() => GetSignupUseCase(locator()));
  locator.registerLazySingleton<SignupRepository>(
      () => SignupRepositoryImpl(signupRemoteDataSource: locator()));
  locator.registerLazySingleton<SignupRemoteDataSource>(
      () => SignupRemoteDataSourceImpl());

///account fetch
locator.registerFactory(() => AccountdetailsBloc(locator()));
  locator.registerLazySingleton(() => GetAccountUseCase(locator()));
  locator.registerLazySingleton<AccountRepository>(
      () => AccountRepositoryImpl(accountRemoteDataSource: locator()));
  locator.registerLazySingleton<AccountRemoteDataSource>(
      () => AccountRemoteDataSourceImpl());

      ///Queue
locator.registerFactory(() => QueueBookBloc(locator()));
  locator.registerLazySingleton(() => GetQueuUseacse(locator()));
  locator.registerLazySingleton<QueueRepository>(
      () => QueueRepositoryImpl(queueRemoteDataSource: locator()));
  locator.registerLazySingleton<QueueRemoteDataSource>(
      () => QueueRemoteDataSourceImpl());
      
}
