part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();
}

class AlbumInitial extends AlbumState {
  @override
  List<Object> get props => [];
}

class GetAllAlbumState extends AlbumState {
  final List<AlbumEntity> albumList;

  const GetAllAlbumState(this.albumList);

  @override
  List<Object?> get props => [albumList];
}

class AlbumErrorState extends AlbumState {
  final String err;

  const AlbumErrorState(this.err);

  @override
  List<Object?> get props => [err];
}
