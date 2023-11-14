import 'package:antbery/config/them/app_style.dart';
import 'package:antbery/features/home/data/data_source/remote/carousel_data_sourece.dart';
import 'package:antbery/features/home/data/repositories/carousel_repository_implement.dart';
import 'package:antbery/features/home/domain/repositories/carousel_repository.dart';
import 'package:antbery/features/home/domain/usecase/get_carousel.dart';
import 'package:antbery/features/home/presentaion/bloc/bloc/carousel_bloc.dart';

import 'package:antbery/features/home/presentaion/bloc/carousel_index_bloc/carousel_bloc.dart';

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
}
