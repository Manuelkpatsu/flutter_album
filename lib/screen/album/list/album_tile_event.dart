import 'package:flutter/material.dart';

abstract class AlbumTileEvent {}

@immutable
class FavoriteAlbumEvent extends AlbumTileEvent {
  final int? albumID;
  final bool favorite;

  FavoriteAlbumEvent(this.albumID, this.favorite);
}

class GoToAlbumIndexScreenEvent extends AlbumTileEvent {
  final int? albumID;

  GoToAlbumIndexScreenEvent(this.albumID);
}
