import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_album_app/domain/entities/album_entity.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/add_album_usecase.dart';

part 'add_album_event.dart';
part 'add_album_state.dart';

class AddAlbumBloc extends Bloc<AddAlbumEvent, AddAlbumState> {
  final AddAlbumUseCases useCases;

  AddAlbumBloc(this.useCases) : super(AddAlbumInitial()) {
    on<ChangeAlbumEvent>(changeAlbum);
    on<SubmitAddAlbumEvent>(submitAddAlbumEvent);
  }

  Future<void> changeAlbum(ChangeAlbumEvent event, Emitter<AddAlbumState> emit) async {
    emit(GetAlbumState(event.text));
  }

  Future<void> submitAddAlbumEvent(SubmitAddAlbumEvent event, Emitter<AddAlbumState> emit) async {
    try {
      await useCases.execute(AlbumEntity(id: 100, title: event.text, number: 00)).then(
          (value) =>
              value.fold((err) => emit(AlbumErrorState(err.message)), (r) {
                emit(AlbumSuccessState());
              }));
    } catch (e) {
      emit(AlbumErrorState('$e'));
    }
  }
}
