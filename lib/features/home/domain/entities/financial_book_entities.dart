import 'package:equatable/equatable.dart';

class FinancialBookEntities extends Equatable{

  final List<dynamic> all;
  final List<dynamic> hotReads;
  final List<dynamic> newbook;

  FinancialBookEntities( {required this.all,required this.hotReads,required this.newbook,  });
  
  @override
    List<Object?> get props => [all,hotReads,newbook];
  
}