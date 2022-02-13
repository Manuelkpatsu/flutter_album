import 'album.dart';

class AlbumListResponse {
  final int resultCount;
  final List<Album> albumList;

  const AlbumListResponse({required this.resultCount, required this.albumList});

  factory AlbumListResponse.fromJson(Map<String, dynamic> json) {
    return AlbumListResponse(
      resultCount: json['resultCount'] ?? 0,
      albumList: json['results'] != null
          ? List<Album>.from(
              json['results'].map((model) => Album.fromJson(model)))
          : [],
    );
  }
}
