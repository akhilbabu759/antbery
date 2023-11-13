import 'package:equatable/equatable.dart';

class CarouselsEntities extends Equatable{
  final List<String> carouselList;

  const CarouselsEntities({required this.carouselList});
  
  @override
  
  List<Object?> get props =>[carouselList];

}