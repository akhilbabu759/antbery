import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';
import 'package:antbery/features/home/domain/entities/self_help_book_entities.dart';

class SelfBookmodel extends SelfBookEntities{
  SelfBookmodel({required List<dynamic> all,required List<dynamic> hotReads,required List<dynamic> newbook}):super(all:all,hotReads: hotReads,newbook: newbook );
  factory SelfBookmodel.fromJson(Map<String, dynamic> json) {
    return SelfBookmodel(all: json['all'] ,
    hotReads:json['hot reads'],newbook: json['new'] );
  }
  
}