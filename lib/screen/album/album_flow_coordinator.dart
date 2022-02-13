import 'package:flutter/material.dart';

import 'index/album_index_screen.dart';

abstract class AlbumFlowCoordinator {
  /// Navigates to [AlbumIndexScreen]
  ///
  /// [albumID] ID of Album
  void goToAlbumIndexScreen(int albumID);

  /// Shows a snackbar
  ///
  /// [message] message to show
  void showSnackBar(String message);
}

class MyAlbumFlowCoordinator extends AlbumFlowCoordinator {
  final BuildContext _context;

  MyAlbumFlowCoordinator(this._context);

  @override
  void goToAlbumIndexScreen(int albumID) {
    Navigator.push(
      _context,
      MaterialPageRoute(
          builder: (context) => AlbumIndexScreen(albumID: albumID)),
    );
  }

  @override
  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }
}
