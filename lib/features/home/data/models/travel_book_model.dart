import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/entities/travel_book_entity.dart';

class Travelmodel extends TravelBookEntities{
  Travelmodel({required List<dynamic> all,required List<dynamic> hotReads,required List<dynamic> newbook}):super(all:all,hotReads: hotReads,newbook: newbook );
  factory Travelmodel.fromJson(Map<String, dynamic> json) {
    return Travelmodel(all: json['all'] ,
    hotReads:json['hot reads'],newbook: json['new'] );
  }
  
}