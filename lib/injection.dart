import 'package:get_it/get_it.dart';
import 'data/datasource/album_remote_datasource.dart';
import 'data/repositories/album_repository_impl.dart';
import 'domain/repositories/album_repository.dart';
import 'domain/usecases/add_album_usecase.dart';
import 'domain/usecases/album_usecases.dart';
import 'presentation/bloc/album/album_bloc.dart';
import 'presentation/bloc/add_album/add_album_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<AlbumRemoteDataSource>(() => AlbumRemoteDataSourceImpl());
  sl.registerFactory<AlbumRepository>(() => AlbumRepositoryImpl(remote: sl()));
  sl.registerLazySingleton(() => GetAllAlbumUseCases(sl()));
  sl.registerLazySingleton(() => AddAlbumUseCases(sl()));
  sl.registerFactory<AlbumBloc>(() => AlbumBloc(sl()));
  sl.registerFactory<AddAlbumBloc>(() => AddAlbumBloc(sl()));
}
