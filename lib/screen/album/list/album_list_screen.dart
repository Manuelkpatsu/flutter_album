import 'package:flutter/material.dart';
import 'package:flutter_album/screen/album/list/widget/album_title_text.dart';
import 'package:flutter_album/screen/album/list/widget/favorite_album_count_badge.dart';

import '../../../locator.dart';
import 'album_list_notifier.dart';
import 'widget/album_list.dart';
import 'widget/loading_indicator.dart';
import 'album_list_listenable.dart';

class AlbumListScreen extends StatefulWidget {
  final int artistID;

  const AlbumListScreen({Key? key, required this.artistID}) : super(key: key);

  @override
  _AlbumListScreenState createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  late final AlbumListNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = get<AlbumListNotifier>();
    _notifier.init(widget.artistID);
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AlbumTitleText(),
        actions: [
          FavoriteAlbumCountBadge(favoriteCountListenable: _notifier.favoriteAlbumCount)
        ],
      ),
      body: Stack(
        children: [
          AlbumList(albumListListenable: _notifier.albumList),
          LoadingIndicator(showLoadingIndicatorListenable: _notifier.showLoadingIndicator)
        ],
      ),
    );
  }
}
