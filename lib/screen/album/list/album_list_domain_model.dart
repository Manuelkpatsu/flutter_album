import 'package:flutter_album/repository/album_repository.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'album_list_model_data.dart';
import 'album_tile_model_data.dart';

class AlbumListDomainModel {
  final Logger _logger = Logger();
  final List<int> favoriteAlbums = [];
  final _albumListModelDataSubject = BehaviorSubject<AlbumListModelData>();
  final AlbumRepository _albumRepository;

  AlbumListDomainModel(this._albumRepository);

  /// Gets the album list model data stream for the given artists ID.
  ///
  /// [artistID] ID of the artist to get the album stream for.
  BehaviorSubject<AlbumListModelData> getAlbumListModelDataStream(
      int artistID) {
    if (!_albumListModelDataSubject.hasListener) {
      _refreshData(artistID);
    }
    return _albumListModelDataSubject;
  }

  /// Gets the album list for the given artists ID.
  ///
  /// [artistID] ID of the artist to get the album stream for.
  void _refreshData(int artistID) {
    _logger.d('Getting album list for artist: $artistID');

    _albumListModelDataSubject
        .add(const AlbumListModelData(loadingAlbums: true));

    _albumRepository.getAlbumListForArtist(artistID).then((albumList) {
      final albumTileModelDataList = albumList
          .map((album) => AlbumTileModelData(
                id: album.collectionId,
                name: album.collectionName,
                thumbnail: album.artworkUrl100,
                price: album.collectionPrice,
                releaseDate: album.releaseDate,
              ))
          .toList();

      final modelData = AlbumListModelData(
        albumTileModelDataList: albumTileModelDataList,
      );
      _albumListModelDataSubject.add(modelData);
    }).whenComplete(() {
      AlbumListModelData modelData;
      if (_albumListModelDataSubject.hasValue) {
        modelData =
            _albumListModelDataSubject.value!.copyWith(loadingAlbums: false);
      } else {
        modelData = const AlbumListModelData(loadingAlbums: false);
      }
      _albumListModelDataSubject.add(modelData);
    }).catchError(((error, stackTrace) {
      _logger.e(
          'Error getting albums for artist: $artistID', error, stackTrace);
    }));
  }

  /// Favorites an album for the given album ID
  ///
  /// [albumID] the album ID
  /// [favorite] true if the album should be favorited, false otherwise
  void favoriteAlbum(int albumID, bool favorite) {
    _logger.d('Favoriting album: $albumID, favorite: $favorite');

    if (favorite) {
      favoriteAlbums.add(albumID);
    } else {
      favoriteAlbums.remove(albumID);
    }

    if (_albumListModelDataSubject.hasValue) {
      final modelData = _albumListModelDataSubject.value!;
      final albumTileModelDataList =
          modelData.albumTileModelDataList.map((album) {
        bool favorite = favoriteAlbums.contains(album.id);
        return album.copyWith(favorite: favorite);
      }).toList();

      final updatedModelData = modelData.copyWith(
        albumTileModelDataList: albumTileModelDataList,
      );
      _albumListModelDataSubject.add(updatedModelData);
    } else {
      _logger.w('_albumListModelDataSubject has no value');
    }
  }

  void dispose() {
    _albumListModelDataSubject.close();
  }
}
