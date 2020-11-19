import 'dart:convert';

class AlbumModel {
    final int albumId;
    final int id;
    final String title;
    final String url;
    final String thumbnailUrl;

  AlbumModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  // Map<String, dynamic> json
  factory AlbumModel.fromJson(final json) => 
    AlbumModel(
      albumId: json["albumId"],
      id: json["id"],
      title: json["title"],
      thumbnailUrl: json["thumbnailUrl"],
    );

  // Iterable
  static List<AlbumModel> toList(String dataString) => 
    List<AlbumModel>.from(json.decode(dataString).map((x) => AlbumModel.fromJson(x)));
}