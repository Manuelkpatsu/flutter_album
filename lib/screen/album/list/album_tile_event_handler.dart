import 'dart:async';

import 'package:logger/logger.dart';

import '../album_flow_coordinator.dart';
import 'album_list_domain_model.dart';
import 'album_tile_event.dart';

class AlbumTileEventHandler {
  final _logger = Logger();
  final AlbumListDomainModel _domainModel;
  final AlbumFlowCoordinator _flowCoordinator;
  late final StreamController<AlbumTileEvent> _eventController;

  AlbumTileEventHandler(this._domainModel, this._flowCoordinator);

  void init(StreamController<AlbumTileEvent> eventController) {
    _eventController = eventController;
    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error, stackTrace) {
      _logger.e("Error handling album tile event", error, stackTrace);
    });
  }

  /// Handles [AlbumTileEvent]s
  _handleEvent(AlbumTileEvent event) {
    if (event is FavoriteAlbumEvent) {
      if (event.albumID != null) {
        _domainModel.favoriteAlbum(event.albumID!, event.favorite);
      } else {
        _logger.w('Trying to favorite an album with no ID');
        _flowCoordinator
            .showSnackBar('Album has no ID and cannot be favorited.');
      }
    } else if (event is GoToAlbumIndexScreenEvent) {
      if (event.albumID != null) {
        _flowCoordinator.goToAlbumIndexScreen(event.albumID!);
      } else {
        _logger.w(
            'Trying to navigate to AlbumIndexScreen for an album with no ID');
        _flowCoordinator.showSnackBar('Album has no ID and cannot be opened.');
      }
    } else {
      _logger.w('Unhandled album tile event type: ${event.runtimeType}');
    }
  }

  void dispose() {
    _eventController.close();
  }
}
