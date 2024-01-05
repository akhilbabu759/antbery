part of 'image_pick_bloc.dart';

sealed class ImagePickState extends Equatable {
  const ImagePickState();
  
  @override
  List< XFile> get props => [];
}

final class ImagePickInitial extends ImagePickState {}
class ImagePicked extends ImagePickState{
  final XFile? image;
   const ImagePicked(this.image);
   @override
  List< XFile> get props => [image!];
}
