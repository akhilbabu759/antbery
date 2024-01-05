import 'dart:io';

import 'package:equatable/equatable.dart';

class SignUpEntities extends Equatable {
  final String name;
  final String email;
  final String address;
  final String pin;
  final String phone;
  final File pic;
  final String password;

  const SignUpEntities(
      {required this.pic,
      required this.password,
      required this.name,
      required this.email,
      required this.address,
      required this.pin,
      required this.phone});

  @override
  List<Object?> get props => [name, email, address, pin, phone, pic,password];
}
