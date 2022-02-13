import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlbumReleaseDateText extends StatelessWidget {
  final String? releaseDate;

  const AlbumReleaseDateText({Key? key, required this.releaseDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (releaseDate == null) {
      return Container();
    } else {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm");
      return Text(dateFormat.format(DateTime.parse(releaseDate!)));
    }
  }
}
