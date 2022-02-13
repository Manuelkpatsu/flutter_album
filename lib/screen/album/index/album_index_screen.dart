import 'package:flutter/material.dart';

class AlbumIndexScreen extends StatefulWidget {
  final int albumID;

  const AlbumIndexScreen({Key? key, required this.albumID}) : super(key: key);

  @override
  _AlbumIndexScreenState createState() => _AlbumIndexScreenState();
}

class _AlbumIndexScreenState extends State<AlbumIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Album Index Screen',
        style: TextStyle(color: Colors.black),
      )),
      body: Center(
          child: Text(
        'Album ID: ${widget.albumID.toString()}',
        style: const TextStyle(color: Colors.black),
      )),
    );
  }
}
