import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:album/services/httpProvider.dart';
import 'package:album/models/albumModel.dart';

class AlbumProvider implements HttpProvider {
  @override
  Future<dynamic> get(String url, {Map<String, String> headers}) async {
    final response = await http.get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      return AlbumModel.toList(response.body);
    } else {
      throw Exception();
    }
  }
}
