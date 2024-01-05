part of 'image_pick_bloc.dart';

sealed class ImagePickEvent extends Equatable {
  const ImagePickEvent();

  @override
  List<Object> get props => [];
}
class OnvalueChange extends ImagePickEvent{
 final XFile image;
  OnvalueChange(this.image);
}