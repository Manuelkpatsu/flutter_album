import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool favorite;
  final GestureTapCallback? onTap;

  const FavoriteButton({Key? key, required this.favorite, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        splashRadius: 20,
        padding: const EdgeInsets.all(5),
          onPressed: onTap,
          icon: Icon(favorite ? Icons.favorite : Icons.favorite_border)
      ),
    );
  }
}
