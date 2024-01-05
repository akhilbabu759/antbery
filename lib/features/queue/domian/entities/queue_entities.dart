import 'package:equatable/equatable.dart';

class QueueEntities extends Equatable{
  final String imgUrl;
  final String bookName;
  final String description;
  final double rating;
  final List<String> libery;
  final String category;
  final String readers;

  const QueueEntities({required this.imgUrl, required this.bookName, required this.description, required this.rating, required this.libery, required this.category, required this.readers});
    @override
  List<Object?> get props => [imgUrl, bookName, description, rating, libery];
}