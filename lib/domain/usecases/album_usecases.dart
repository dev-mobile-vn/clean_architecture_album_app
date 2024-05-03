import 'package:dartz/dartz.dart';
import '../entities/album_entity.dart';
import '../failures/failures.dart';
import '../repositories/album_repository.dart';

class GetAllAlbumUseCases {
  final AlbumRepository repository;
  GetAllAlbumUseCases(this.repository);


  Future<Either<RemoteFailure, List<AlbumEntity>>> execute() => repository.fetch();
}

