import 'package:equatable/equatable.dart';

class AlbumEntity extends Equatable {
  final int id;
  final String title;

  final int number;

  const AlbumEntity({required this.id, required this.title, required this.number});

  @override
  List<Object?> get props => [id, title, number];
}
