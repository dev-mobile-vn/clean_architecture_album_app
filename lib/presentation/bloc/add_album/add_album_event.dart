part of 'add_album_bloc.dart';

abstract class AddAlbumEvent extends Equatable {
  const AddAlbumEvent();
}

class InitAlbumEvent extends AddAlbumEvent {
  @override
  List<Object?> get props => [];
}

class ChangeAlbumEvent extends AddAlbumEvent {
  final String text;

  const ChangeAlbumEvent(this.text);

  @override
  List<Object?> get props => [text];
}

class SubmitAddAlbumEvent extends AddAlbumEvent {
  final String text;

  const SubmitAddAlbumEvent(this.text);

  @override
  List<Object?> get props => [text];
}
