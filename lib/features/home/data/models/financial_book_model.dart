import 'package:antbery/features/home/domain/entities/financial_book_entities.dart';

class Financialmodel extends FinancialBookEntities{
  Financialmodel({required List<dynamic> all,required List<dynamic> hotReads,required List<dynamic> newbook}):super(all:all,hotReads: hotReads,newbook: newbook );
  factory Financialmodel.fromJson(Map<String, dynamic> json) {
    return Financialmodel(all: json['all'] ,
    hotReads:json['hot reads'],newbook: json['new'] );
  }
  
}