import 'package:clean_architecture_album_app/domain/entities/album_entity.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/album.dart';
import '../failures/failures.dart';

abstract class AlbumRepository {
  Future<Either<RemoteFailure, List<AlbumEntity>>> fetch();
  Future<Either<RemoteFailure, AlbumEntity>> add(AlbumEntity entity);
}
