import 'package:clean_architecture_album_app/data/models/album.dart';
import 'package:dio/dio.dart';
import 'remote_data/rest_client.dart';

abstract class AlbumRemoteDataSource {
  Future<List<Album>> fetch();
  Future<Album> add(Album album);
}

class AlbumRemoteDataSourceImpl extends AlbumRemoteDataSource {
  final restClient = RestClient(Dio());

  @override
  Future<Album> add(Album album) => restClient.addAlbum(album);

  @override
  Future<List<Album>> fetch() => restClient.fetch();
}
