import 'dart:io';

import 'package:antbery/features/auth/sinup/domain/entities/signup_enities.dart';

class Signupmodel extends SignUpEntities {
  Signupmodel(
      {required File pic,
      required String name,
      required String email,
      required String address,
      required String pin,
      required String phone,password})
      : super(password: password,pic: pic,
          address: address,
          email: email,
          name: name,
          phone: phone,
          pin: pin,
        );
         factory Signupmodel.fromJson(Map<String, dynamic> json) {
          return Signupmodel(
            address:json['address'] ,email:json['email'] ,name:json['name']  ,phone:json['phone']  ,pic: json['pic'] ,pin: json['pin'] 
          );
         }
}
