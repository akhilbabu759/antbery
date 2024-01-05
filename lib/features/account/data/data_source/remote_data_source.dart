import 'dart:developer';

import 'package:antbery/features/account/data/model/account_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AccountRemoteDataSource {
  Future<Accountmodel?> getSignup();
}

class AccountRemoteDataSourceImpl extends AccountRemoteDataSource {
  @override
  Future<Accountmodel?> getSignup()async {
     try{
                  CollectionReference queueCollection =
                      FirebaseFirestore.instance.collection('useracc');
                  DocumentReference akhilDoc = queueCollection
                      .doc(FirebaseAuth.instance.currentUser!.email);

                  DocumentSnapshot docSnapshot = await akhilDoc.get();
                      final data= docSnapshot.data() as Map<String,dynamic>;
                      log(data.toString(),name: 'uiopuuyuy');
                      final revalue=Accountmodel.fromJson(data);
                      log(revalue.toString(),name: 'opjjk');

                  return revalue;

    
  } on FirebaseException catch(e){
    log(e.toString(),name: 'ola ola ');
  }

}}