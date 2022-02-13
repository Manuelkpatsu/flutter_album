import 'package:flutter/foundation.dart';
import 'package:functional_listener/functional_listener.dart';

import 'album_list_notifier.dart';
import 'album_tile_model_data.dart';

extension AlbumListListenable on AlbumListNotifier {
  /// The album list.
  ValueListenable<List<AlbumTileModelData>> get albumList =>
      map((m) => m.albumTileModelDataList);

  /// The number of favorited albums.
  ValueListenable<int> get favoriteAlbumCount => map(
      (m) => m.albumTileModelDataList.where((album) => album.favorite).toList().length);

  /// The progress indicator visibility.
  ValueListenable<bool> get showLoadingIndicator => map((m) => m.loadingAlbums);
}
