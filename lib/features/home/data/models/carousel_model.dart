import 'package:antbery/features/home/domain/entities/carousel_entities.dart';

class Carouselmodel extends CarouselsEntities {
  const Carouselmodel({required String img_url})
      : super(img_url: img_url);
      factory Carouselmodel.fromJson(String json, ) {
        
       return (Carouselmodel(img_url: json ));

        }
        
     
    

CarouselsEntities toEntity() => CarouselsEntities(
      img_url: img_url
      );
}
