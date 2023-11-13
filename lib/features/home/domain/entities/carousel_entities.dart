import 'package:equatable/equatable.dart';

class CarouselsEntities extends Equatable{
  final String img_url;

  const CarouselsEntities({required this.img_url});
  
  @override
  
  List<Object?> get props =>[img_url];

}