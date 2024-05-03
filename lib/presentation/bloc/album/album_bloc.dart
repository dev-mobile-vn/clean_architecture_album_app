import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_album_app/domain/entities/album_entity.dart';
import 'package:clean_architecture_album_app/domain/usecases/album_usecases.dart';
import 'package:equatable/equatable.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final GetAllAlbumUseCases useCases;

  AlbumBloc(this.useCases) : super(AlbumInitial()) {
    print('=========');
    on<GetAllAlbumEvent>(onGetAllAlbum);
  }

  Future<void> onGetAllAlbum(event, emit) async {
    try {
      await useCases.execute().then((value) => value.fold(
          (err) => emit(AlbumErrorState(err.message)),
          (albumList) {
            emit(GetAllAlbumState(albumList));
          }));
    } catch (e) {
      emit(AlbumErrorState('$e'));
    }
  }
}
