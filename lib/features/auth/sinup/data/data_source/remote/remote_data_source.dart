import 'dart:developer';

import 'package:antbery/features/auth/sinup/data/model/signup_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class SignupRemoteDataSource {
  Future<Signupmodel> getSignup(Signupmodel data);
}

class SignupRemoteDataSourceImpl extends SignupRemoteDataSource {
  @override
  Future<Signupmodel> getSignup(data) async {
//      Map<String, dynamic> newData =  {'name':'','email':'pname','address':'pl','pin':'','phone':,'pic':,'password':}
//   // Add other fields as needed
// ;
    // Add other fields as needed
    ;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: data.email, password: data.password);
      String downloadURL = '';
      final FirebaseStorage _storage =
          FirebaseStorage.instanceFor(bucket: 'gs://antbery-49fb6.appspot.com');
      final DocumentReference teacherDocument =
          FirebaseFirestore.instance.collection('useracc').doc(data.email);
      Reference firebaseStorageRef =
          _storage.ref().child('images/profile/${DateTime.now()}.jpg');
      UploadTask uploadTask = firebaseStorageRef.putFile(data.pic!);
      await uploadTask.whenComplete(() async {
        downloadURL = await firebaseStorageRef.getDownloadURL();
      });
      print('Image uploaded to Firebase Storage');

// Add the new data to the document
      Map<String, String> firedata = {
        'pic': downloadURL,
        'name': data.name,
        'email': data.email,
        'password': data.password,
        'address': data.address,
        'pin': data.pin,
        'phone': data.password
      };
      teacherDocument.set(firedata, SetOptions(merge: true)).then((_) {
        if (kDebugMode) {
          print("Data added or updated successfully!");
        }
        return data;
      }).catchError((error) {
        if (kDebugMode) {
          print("Error adding/updating data: $error");
        }
      });
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
// Reference to the Firestore document

    return await data;
  }
}
