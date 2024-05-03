import 'dart:math';

import 'package:equatable/equatable.dart';
import '../../domain/entities/album_entity.dart';

class Album extends Equatable {
  final int id;
  final String title;

  const Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> js) =>
      Album(id: js['id'], title: js['title']);

  Map<String, dynamic> toJson() => {"title": title};

  factory Album.fromEntity(AlbumEntity entity) {
    return Album(id: entity.id, title: entity.title);
  }

  AlbumEntity toEntity() {
    return AlbumEntity(id: id, title: title, number: Random().nextInt(1000));
  }

  @override
  List<Object?> get props => [id, title];
}
