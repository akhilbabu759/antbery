import 'dart:developer';

import 'package:antbery/features/home/data/models/carousel_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
abstract class CarouselRemoteDataSource{
  Future<List<Carouselmodel>> getCarousels();
}

class CarouselRemoteDataSourceImpl extends CarouselRemoteDataSource{
  @override
  Future<List<Carouselmodel>> getCarousels() async {
     CollectionReference imagesCollection = FirebaseFirestore.instance.collection('carousels');

  try {
    QuerySnapshot querySnapshot = await imagesCollection.get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs.cast<QueryDocumentSnapshot>().toList();
    final h= documents.map((e) => e.data());
// log(h.first.toString());

     log(querySnapshot.docs.toString());
    log(querySnapshot.docs.first['images'].toString());
    // Iterable<Object?> listUrls=documents.map((e) => e.data());
    // log(listUrls.map((e) => e).toString(),name: 'bfjk');
    
    // for(String i in querySnapshot.docs.first['images']){

    //   images.add(Carouselmodel)
      
    // }
    List<Carouselmodel> images=[];
    for(String i in querySnapshot.docs.first['images']){
       images.add(Carouselmodel.fromJson( i));
    }

    //  =  Carouselmodel.fromJson( querySnapshot.docs.first['images']);
          
          log(images.toString());

    return images;
  } catch (e) {
    print("Error fetching images: $e");
    return [];
  }
   
    
  }

} 