import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class AlbumTileModelData extends Equatable {
  final int? id;
  final String? name;
  final String? thumbnail;
  final double? price;
  final String? releaseDate;
  final bool favorite;

  const AlbumTileModelData({
    this.id,
    this.name,
    this.thumbnail,
    this.price,
    this.releaseDate,
    this.favorite = false,
  });

  AlbumTileModelData copyWith(
      {int? id,
      String? name,
      String? thumbnail,
      double? price,
      String? releaseDate,
      bool? favorite}) {
    return AlbumTileModelData(
      id: id ?? this.id,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      releaseDate: releaseDate ?? this.releaseDate,
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  List<Object?> get props =>
      [id, name, thumbnail, price, releaseDate, favorite];
}
