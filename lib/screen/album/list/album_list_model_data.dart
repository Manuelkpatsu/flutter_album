import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'album_tile_model_data.dart';

@immutable
class AlbumListModelData extends Equatable {
  final List<AlbumTileModelData> albumTileModelDataList;
  final bool loadingAlbums;

  const AlbumListModelData({
    this.albumTileModelDataList = const [],
    this.loadingAlbums = false,
  });

  AlbumListModelData copyWith({
    List<AlbumTileModelData>? albumTileModelDataList,
    bool? loadingAlbums,
  }) {
    return AlbumListModelData(
      albumTileModelDataList: albumTileModelDataList ?? this.albumTileModelDataList,
      loadingAlbums: loadingAlbums ?? this.loadingAlbums,
    );
  }

  @override
  List<Object?> get props => [albumTileModelDataList, loadingAlbums];
}
