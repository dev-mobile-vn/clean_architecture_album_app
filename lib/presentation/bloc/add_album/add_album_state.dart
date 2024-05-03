part of 'add_album_bloc.dart';

abstract class AddAlbumState extends Equatable {
  const AddAlbumState();
}

class AddAlbumInitial extends AddAlbumState {
  @override
  List<Object> get props => [];
}

class GetAlbumState extends AddAlbumState {
  final String title;

  const GetAlbumState(this.title);

  @override
  List<Object> get props => [title];
}

class AlbumSuccessState extends AddAlbumState {
  @override
  List<Object?> get props => [];
}

class AlbumErrorState extends AddAlbumState {
  final String err;

  const AlbumErrorState(this.err);

  @override
  List<Object?> get props => [err];
}
