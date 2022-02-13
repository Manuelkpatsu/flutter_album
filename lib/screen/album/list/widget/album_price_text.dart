import 'package:flutter/material.dart';

class AlbumPriceText extends StatelessWidget {
  final double? price;

  const AlbumPriceText({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(price != null ? '\$${price!.toStringAsFixed(2)}' : '');
  }
}
