import 'package:dartz/dartz.dart';
import '../entities/album_entity.dart';
import '../failures/failures.dart';
import '../repositories/album_repository.dart';

class AddAlbumUseCases {
  final AlbumRepository repository;

  AddAlbumUseCases(this.repository);
  Future<Either<RemoteFailure, AlbumEntity>> execute(AlbumEntity album) =>
      repository.add(album);
}
