import 'package:clean_architecture_album_app/data/models/album.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/albums')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('')
  Future<Album> addAlbum(@Body() Album album);

  @GET('')
  Future<List<Album>> fetch();
}
