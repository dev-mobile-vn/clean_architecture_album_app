part of 'album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();
}

class GetAllAlbumEvent extends AlbumEvent {
  @override
  List<Object?> get props => [];
}

class AddAlbumEvent extends AlbumEvent {
  final AlbumEntity entity;

  const AddAlbumEvent(this.entity);

  @override
  List<Object?> get props => [entity];
}
