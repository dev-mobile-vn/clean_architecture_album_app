import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injection.dart';
import '../../presentation/bloc/add_album/add_album_bloc.dart';
import '../../presentation/bloc/album/album_bloc.dart';
import '../../presentation/page/add_album_page.dart';
import '../../presentation/page/albums_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => sl.get<AlbumBloc>(),
                  child: const AlbumsPage(),
                ));
      case '/add-album':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => sl.get<AddAlbumBloc>(),
                  child: const AddAlbumPage(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => sl.get<AlbumBloc>(),
                  child: const AlbumsPage(),
                ));
    }
  }
}
