import 'package:antbery/features/home/domain/entities/carousel_entities.dart';

class Carouselodel extends CarouselsEntities {
  const Carouselodel({required List<String> carosellist})
      : super(carouselList: carosellist);
      factory Carouselodel.fromJson(Map<String, dynamic> json) {
    return Carouselodel(carosellist:  List<String>.from(json['images']),
    );
}
CarouselsEntities toEntity() => CarouselsEntities(
      carouselList: carouselList
      );
}
