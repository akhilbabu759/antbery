import 'package:antbery/features/queue/domian/entities/queue_entities.dart';

class Queuemodel extends QueueEntities{
 Queuemodel(
      {required String bookName,
      required String imgUrl,
      required List<String> libery,
      required double rating,
      required String description,
      required String category,
      required String readers})
      : super(
            imgUrl: imgUrl,
            bookName: bookName,
            description: description,
            rating: rating,
            libery: libery,readers:readers,category:category);
            factory Queuemodel.fromJson(Map<String, dynamic> json) {
    // log(json.values.first['rating'].toString(), name: 'mosel 1');
    // log(json.keys.first.toString(), name: 'mosel 2');
    // log(json.values.first['image'].toString(), name: 'mosel 6');
    return Queuemodel(category:json.values.first['category'] ,readers: json.values.first['readers'],
      bookName: json
          .keys.first, // Assuming the book title is the key in the provided map
      imgUrl: json.values.first['image'],
      libery: List<String>.from(json.values.first["libery' s"]),
      rating: json.values.first['rating'] ?? 0.0,
      description: json.values.first['description'],
    );
  }
}