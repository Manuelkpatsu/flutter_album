import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_album/screen/album/list/widget/album_thumbnail_image.dart';

import '../../../locator.dart';
import 'album_tile_event.dart';
import 'album_tile_event_handler.dart';
import 'album_tile_model_data.dart';
import 'widget/album_name_text.dart';
import 'widget/album_price_text.dart';
import 'widget/album_release_date_text.dart';
import 'widget/favorite_button.dart';

class AlbumTile extends StatefulWidget {
  final AlbumTileModelData modelData;

  AlbumTile(this.modelData) : super(key: ValueKey(modelData.id));

  @override
  _AlbumTileState createState() => _AlbumTileState();
}

class _AlbumTileState extends State<AlbumTile> {
  final _eventController = StreamController<AlbumTileEvent>();
  late final AlbumTileEventHandler _eventHandler;

  @override
  void initState() {
    super.initState();
    _eventHandler = get<AlbumTileEventHandler>(param1: context);
    _eventHandler.init(_eventController);
  }

  @override
  void dispose() {
    _eventHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelData = widget.modelData;
    return InkWell(
      onTap: () => _eventController.add(GoToAlbumIndexScreenEvent(modelData.id)),
      child: Ink(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            AlbumThumbnailImage(thumbnail: modelData.thumbnail),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AlbumNameText(name: modelData.name),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      AlbumPriceText(price: modelData.price),
                      const Spacer(),
                      AlbumReleaseDateText(releaseDate: modelData.releaseDate),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            FavoriteButton(
              favorite: modelData.favorite,
              onTap: () {
                _eventController
                    .add(FavoriteAlbumEvent(modelData.id, !modelData.favorite));
              },
            )
          ],
        ),
      ),
    );
  }
}
