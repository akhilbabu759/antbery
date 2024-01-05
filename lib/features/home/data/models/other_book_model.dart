import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/entities/other_book_entities.dart';

class Othermodel extends OtherBookEntities{
  Othermodel({required List<dynamic> all,required List<dynamic> hotReads,required List<dynamic> newbook}):super(all:all,hotReads: hotReads,newbook: newbook );
  factory Othermodel.fromJson(Map<String, dynamic> json) {
    return Othermodel(all: json['all'] ,
    hotReads:json['hot reads'],newbook: json['new'] );
  }
  
}