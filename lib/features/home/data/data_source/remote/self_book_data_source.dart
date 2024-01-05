import 'dart:developer';

import 'package:antbery/features/home/data/models/financial_book_model.dart';
import 'package:antbery/features/home/data/models/self_book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SelfBookListRemoteDataSource {
  Future<List<SelfBookmodel>> getBookList();
}

class SelfBookListRemoteDataSourceImpl
    extends SelfBookListRemoteDataSource {
  @override
  Future<List<SelfBookmodel>> getBookList() async {
    CollectionReference imagesCollection =
        FirebaseFirestore.instance.collection('self help');
    try {
      QuerySnapshot querySnapshot = await imagesCollection.get();
      log(querySnapshot.toString(), name: 'SelfBookmodel');
      List<QueryDocumentSnapshot> documents =
          querySnapshot.docs.cast<QueryDocumentSnapshot>().toList();
          log('oop',name: 'kasdmdnd');
      final h = documents.map((e) => e.data());
      log(h.first.toString(), name: 'nm1');
      // log(querySnapshot.docs.toString(),name: 'nm2');

      Map<String, dynamic> parsedData = h.first as Map<String, dynamic>;
      log(parsedData.toString(), name: 'n6');
      log(parsedData['all'].toString(), name: 'n8');
      List<String> finabooks = List<String>.from(parsedData['all']);
      log(finabooks.toString(), name: 'n3');

      SelfBookmodel bookList = SelfBookmodel.fromJson(parsedData);
      log(bookList.toString(), name: 'self');

      return [bookList];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
