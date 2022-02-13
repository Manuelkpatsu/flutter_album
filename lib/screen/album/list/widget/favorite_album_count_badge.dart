import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavoriteAlbumCountBadge extends StatelessWidget {
  final ValueListenable<int> favoriteCountListenable;

  const FavoriteAlbumCountBadge({Key? key, required this.favoriteCountListenable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: ValueListenableBuilder<int>(
        valueListenable: favoriteCountListenable,
        builder: (context, favoriteAlbumCount, child) {
          return Text(
            favoriteAlbumCount.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          );
        },
      ),
      child: const Icon(Icons.my_library_music_rounded),
    );
  }
}
