import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'album_list_domain_model.dart';
import 'album_list_model_data.dart';

class AlbumListNotifier extends ValueNotifier<AlbumListModelData> {
  final Logger _logger = Logger();
  final AlbumListDomainModel _domainModel;

  AlbumListNotifier(this._domainModel) : super(const AlbumListModelData());

  void init(int artistID) {
    _domainModel
        .getAlbumListModelDataStream(artistID)
        .listen((modelData) => value = modelData)
        .onError((error, stackTrace) {
      _logger.e('Error subscribing to artist: $artistID album stream', error, stackTrace);
    });
  }

  @override
  void dispose() {
    _domainModel.dispose();
    super.dispose();
  }
}
