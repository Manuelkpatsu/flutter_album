import 'package:flutter/material.dart';

class AlbumThumbnailImage extends StatelessWidget {
  final String? thumbnail;

  const AlbumThumbnailImage({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return thumbnail != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              thumbnail!,
              width: 100,
              height: 70,
              fit: BoxFit.cover,
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/default-image.jpeg',
              width: 100,
              height: 70,
              fit: BoxFit.cover,
            ),
          );
  }
}
