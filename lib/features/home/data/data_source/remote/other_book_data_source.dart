import 'dart:developer';

import 'package:antbery/features/home/data/models/financial_book_model.dart';
import 'package:antbery/features/home/data/models/other_book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class OtherBookListRemoteDataSource {
  Future<List<Othermodel>> getBookList();
}

class OtherBookListRemoteDataSourceImpl
    extends OtherBookListRemoteDataSource {
  @override
  Future<List<Othermodel>> getBookList() async {
    CollectionReference imagesCollection =
        FirebaseFirestore.instance.collection('other');
    try {
      QuerySnapshot querySnapshot = await imagesCollection.get();
      log(querySnapshot.toString(), name: 'other');
      List<QueryDocumentSnapshot> documents =
          querySnapshot.docs.cast<QueryDocumentSnapshot>().toList();
      final h = documents.map((e) => e.data());
      log(h.first.toString(), name: 'nm1');
      // log(querySnapshot.docs.toString(),name: 'nm2');

      Map<String, dynamic> parsedData = h.first as Map<String, dynamic>;
      log(parsedData.toString(), name: 'n6');
      log(parsedData['all'].toString(), name: 'n8');
      List<String> finabooks = List<String>.from(parsedData['all']);
      log(finabooks.toString(), name: 'n3');

      Othermodel bookList = Othermodel.fromJson(parsedData);
      log(bookList.toString(), name: 'finalciallist');

      return [bookList];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
