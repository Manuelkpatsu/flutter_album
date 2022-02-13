import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_album/model/album.dart';
import 'package:flutter_album/model/album_list_response.dart';

class AlbumRepository {
  final Dio _dio;

  AlbumRepository(this._dio);

  /// Gets the albums for the given artists ID.
  ///
  /// [artistID] ID of the artist to get the album for.
  Future<List<Album>> getAlbumListForArtist(int artistID) {
    return _dio.get(
      '/lookup',
      queryParameters: {'id': artistID, 'entity': 'album'},
    ).then((response) {
      if (response.statusCode == 200) {
        return AlbumListResponse.fromJson(jsonDecode(response.data)).albumList;
      } else {
        return Future.error(
          'Failed to get album. statusCode: ${response.statusCode}, statusMessage: ${response.statusMessage}',
        );
      }
    });
  }
}
