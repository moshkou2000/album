import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:album/models/AlbumModel.dart';

Future<List<AlbumModel>> getAlbum(url) async {
  final response = await http.get(Uri.encodeFull(url));
  if (response.statusCode == 200) {
    return compute(AlbumModel.toList, response.body);
  } else {
    throw Exception();
  }
}
