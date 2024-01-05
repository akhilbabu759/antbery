import 'dart:developer';

import 'package:antbery/features/queue/data/models/queuebook_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class QueueRemoteDataSource {
  Future<List<Queuemodel>> getBookList();
}

class QueueRemoteDataSourceImpl extends QueueRemoteDataSource {
  @override
  Future<List<Queuemodel>> getBookList() async {
    log('called', name: 'nm0');

    CollectionReference queueCollection =
        FirebaseFirestore.instance.collection('queue');
    DocumentReference imagesCollection =
        queueCollection.doc(FirebaseAuth.instance.currentUser!.email);
    try {
      log('nknnn');
      DocumentSnapshot querySnapshot = await imagesCollection.get();
      log(querySnapshot.data().toString());
      Map<String,dynamic> val=querySnapshot.data() as Map<String,dynamic> ;
      log(val['list'].toString(),name: 'jkjj');
      List<dynamic> documents =
          val['list'] ;
          log(documents.toString());
      // final h = documents.map((e) => e.data());
      // // log(h.first.toString(),name: 'nm1');
      // // log(querySnapshot.docs.toString(),name: 'nm2');

      // Map<String, dynamic> parsedData = h.first as Map<String, dynamic>;
      // // log(parsedData.toString(),name: 'nm3');
      // List<Map<String, dynamic>> books =
      //     List<Map<String, dynamic>>.from(parsedData['bookslist']);
      // log(books.toString(),name: 'nm4');

      List<Queuemodel> bookList = documents.map((document) {
        // log(bookData.values.first['image'],name: 'inside1');
        log(document.toString(),name: 'ariyo');

        //  log(List<String>.from(bookData.values.first["libery' s"]).toString(),name: 'inside2');
        return Queuemodel.fromJson(document);
      }).toList();
       log(bookList.toString(),name: 'ariyo2');
      // log(bookList.toString(),name: 'nm5');

      // Now you have a list of Book objects
      // for (Book book in bookList) {
      //   log("Title: ${book.bookName}",name: '1');
      //   log("Image URL: ${book.imgUrl}",name: '2');
      //   log("Libraries: ${book.libery}",name: '3');
      //   log("Rating: ${book.rating}",name: '4');
      //   log("Description: ${book.description}",name: '5');
      //   log("\n");
      // }
      return bookList;
    } catch (e) {
      print("Error fetching images: $e");
      return [];
    }
  }
}
