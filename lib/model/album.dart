class Album {
  int? collectionId;
  String? collectionName;
  String? artworkUrl100;
  double? collectionPrice;
  String? releaseDate;

  Album({
    this.collectionId,
    this.collectionName,
    this.artworkUrl100,
    this.collectionPrice,
    this.releaseDate,
  });

  Album.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'];
    releaseDate = json['releaseDate'];
  }
}
