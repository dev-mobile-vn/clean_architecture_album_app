import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/album_entity.dart';
import '../../injection.dart';
import '../bloc/album/album_bloc.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  late AlbumBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = sl.get<AlbumBloc>()..add(GetAllAlbumEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text('Albums'),
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.pushNamed(context, "/add-album")
                    .then((value) => bloc..add(GetAllAlbumEvent()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is AlbumInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllAlbumState) {
            return ListView.builder(
                itemCount: state.albumList.length,
                itemBuilder: (_, index) {
                  AlbumEntity album = state.albumList[index];
                  return ListTile(
                    title: Text('${album.id}'),
                    subtitle: Text(album.title),
                  );
                });
          } else if (state is AlbumErrorState) {
            return Center(
              child: Text(state.err),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
