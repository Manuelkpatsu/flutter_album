import 'package:flutter/material.dart';

class AlbumNameText extends StatelessWidget {
  final String? name;

  const AlbumNameText({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name ?? '',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
