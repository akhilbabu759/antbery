

import 'package:equatable/equatable.dart';

class AccountEntities extends Equatable{
   final String name;
  final String email;
  final String address;
  final String pin;
  final String phone;
  final String pic;
  final String password;

  AccountEntities({required this.name, required this.email, required this.address, required this.pin, required this.phone, required this.pic, required this.password});
  
  @override
  // TODO: implement props
  List<Object?> get props => [name, email, address, pin, phone, pic,password];
}