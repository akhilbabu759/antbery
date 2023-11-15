import 'dart:convert';
import 'dart:developer';

import 'package:antbery/features/home/data/models/book_list_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BookListRemoteDataSource{
  Future<List<Book>> getBookList();
}
class BookListRemoteDataSourceImpl extends BookListRemoteDataSource{
  @override
  Future<List<Book>> getBookList()async {
     log('called',name: 'nm0');
    
    CollectionReference imagesCollection = FirebaseFirestore.instance.collection('books');
    try{
      QuerySnapshot querySnapshot = await imagesCollection.get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs.cast<QueryDocumentSnapshot>().toList();
    final h= documents.map((e) => e.data());
    // log(h.first.toString(),name: 'nm1');
    // log(querySnapshot.docs.toString(),name: 'nm2');


      Map<String, dynamic> parsedData = h.first as Map<String, dynamic>;
      // log(parsedData.toString(),name: 'nm3');
  List<Map<String, dynamic>> books = List<Map<String, dynamic>>.from(parsedData['bookslist']);
  log(books.toString(),name: 'nm4');

  List<Book> bookList = books.map((bookData) {
    log(bookData.values.first['image'],name: 'inside1');
     
     log(List<String>.from(bookData.values.first["libery' s"]).toString(),name: 'inside2');
    return Book.fromJson(bookData);
  }).toList();
  log(bookList.toString(),name: 'nm5');

  // Now you have a list of Book objects
  for (Book book in bookList) {
    log("Title: ${book.bookName}",name: '1');
    log("Image URL: ${book.imgUrl}",name: '2');
    log("Libraries: ${book.libery}",name: '3');
    log("Rating: ${book.rating}",name: '4');
    log("Description: ${book.description}",name: '5');
    log("\n");
  }
  return bookList;

    }catch (e) {
    print("Error fetching images: $e");
    return [];
  }
  
  }

}