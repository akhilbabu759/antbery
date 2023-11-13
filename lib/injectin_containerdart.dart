import 'package:antbery/config/them/app_style.dart';
import 'package:antbery/features/home/presentaion/bloc/carousel_bloc/carousel_bloc.dart';


import 'package:get_it/get_it.dart';
final locator = GetIt.instance;
void setUpLocator() {
  locator.registerFactory(() => CarouselBloc());
  locator.registerSingleton(() => AppStryle());
}