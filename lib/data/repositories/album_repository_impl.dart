import 'package:clean_architecture_album_app/data/datasource/remote_data/rest_client.dart';
import 'package:clean_architecture_album_app/data/models/album.dart';
import 'package:clean_architecture_album_app/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/album_entity.dart';
import '../../domain/repositories/album_repository.dart';
import '../datasource/album_remote_datasource.dart';

class AlbumRepositoryImpl extends AlbumRepository {
  final AlbumRemoteDataSource remote;

  AlbumRepositoryImpl({required this.remote});

  @override
  Future<Either<RemoteFailure, AlbumEntity>> add(AlbumEntity entity) async {
    try {
      Album album = await remote.add(Album.fromEntity(entity));
      return right(album.toEntity());
    } on DioException catch (e) {
      return left(RemoteFailure(e.message!));
    }
  }

  @override
  Future<Either<RemoteFailure, List<AlbumEntity>>> fetch() async {
    try {
      List<Album> list = await remote.fetch();
      return right(list.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return left(RemoteFailure(e.message!));
    }
  }
}
