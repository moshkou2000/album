import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:album/services/httpProvider.dart';
import 'package:album/models/albumModel.dart';

class AlbumProvider {
  final String api = 'someapi';

  final HttpProvider http;

  AlbumProvider({@required this.http});

  Future<List<AlbumModel>> getAlbum(url) async {
    final response = await http.get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      return compute(AlbumModel.toList, response.body);
    } else {
      throw Exception();
    }
  }
}
