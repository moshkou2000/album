import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:album/models/AlbumModel.dart';
import 'package:http/http.dart' as http;

Future<List<AlbumModel>> getAlbum(http.Client client) async {
  final response = await client.get(
      Uri.encodeFull('https://jsonplaceholder.typicode.com/photos?albumId=1'));
  if (response.statusCode == 200) {
    return compute(AlbumModel.toList, response.body);
  } else {
    throw Exception();
  }
}
