import 'package:antbery/features/home/domain/entities/book_list_entities.dart';

class Book extends BookListEntities {
  

  const Book({
    required String bookName,
    required String imgUrl,
    required List<String> libery,
    required double rating,
    required String description,
  }) : super(imgUrl: imgUrl, bookName: bookName, description: description, rating:rating, libery: libery);

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookName: json.keys.first, // Assuming the book title is the key in the provided map
      imgUrl: json.values.first['image'],
      libery: List<String>.from(json.values.first["libery' s"]),
      rating: json.values.first['rating']??0.0,
      description: json.values.first['description'],
    );
  }
}
