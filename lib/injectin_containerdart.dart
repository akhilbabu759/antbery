import 'package:antbery/config/them/app_style.dart';
import 'package:antbery/features/home/data/data_source/remote/book_list_data_source.dart';
import 'package:antbery/features/home/data/data_source/remote/carousel_data_sourece.dart';
import 'package:antbery/features/home/data/repositories/book_list_repositories_iplement.dart';
import 'package:antbery/features/home/data/repositories/carousel_repository_implement.dart';
import 'package:antbery/features/home/domain/repositories/book_list_repositories.dart';
import 'package:antbery/features/home/domain/repositories/carousel_repository.dart';
import 'package:antbery/features/home/domain/usecase/get_book_list.dart';
import 'package:antbery/features/home/domain/usecase/get_carousel.dart';
import 'package:antbery/features/home/presentaion/bloc/bloc/carousel_bloc.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel_index_bloc/carousel_bloc.dart';
import 'package:antbery/features/home/presentaion/bloc/home_books/home_books_bloc.dart';

import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
void setUpLocator() {
  locator.registerFactory(() => CarouselBloc(locator()));
  locator.registerFactory(() => CarouselIndexBloc());
  locator.registerSingleton(() => AppStryle());
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


}
