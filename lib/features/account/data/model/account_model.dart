import 'dart:developer';

import 'package:antbery/features/account/domain/entities/account_entities.dart';

class Accountmodel extends AccountEntities {
  Accountmodel(
      {required String pic,
      required String name,
      required String email,
      required String address,
      required String pin,
      required String phone,
      password})
      : super(
          password: password,
          pic: pic,
          address: address,
          email: email,
          name: name,
          phone: phone,
          pin: pin,
        );
  factory Accountmodel.fromJson(Map<String, dynamic> json) {
    log(json['address']);
    log(json['email']);
    log(json['name']);
    log(json['phone']);
    log(json['pic']);
    log(json['pin']);
    return Accountmodel(
        address: json['address'],
        email: json['email'],
        name: json['name'],
        phone: json['phone'],
        pic: json['pic'],
        pin: json['pin'],
        password:json['password']
        );
  }
}
