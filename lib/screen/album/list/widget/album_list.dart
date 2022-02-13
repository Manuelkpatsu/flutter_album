import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../album_tile.dart';
import '../album_tile_model_data.dart';

class AlbumList extends StatelessWidget {
  final ValueListenable<List<AlbumTileModelData>> albumListListenable;

  const AlbumList({Key? key, required this.albumListListenable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<AlbumTileModelData>>(
      valueListenable: albumListListenable,
      builder: (context, modelDataList, child) {
        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(height: 0),
          itemCount: modelDataList.length,
          itemBuilder: (context, index) => AlbumTile(modelDataList[index]),
        );
      },
    );
  }
}
