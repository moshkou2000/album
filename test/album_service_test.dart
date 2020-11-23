import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';

import 'package:album/blocs/mainBlock.dart';
import 'package:album/models/albumModel.dart';
import 'package:album/services/albumProvider.dart';

class MockAlbumProvider extends Mock implements http.Client {}

main() {
  group('fetchPost', () {
    test('returns a Post if the http call completes successfully', () async {
      final client = MockAlbumProvider();
      AlbumProvider ap;

      // return a successful response
      when(client.get(URL_TOKENLESS_HOME_1)).thenAnswer((_) async => http.Response(
          '[{"title": "accusamus beatae ad facilis cum similique qui sunt", "albumId":1, "id":1, "url": "https://via.placeholder.com/600/92c952","thumbnailUrl": "https://via.placeholder.com/150/92c952"}]',
          200));

      expect(await ap.getAlbum(client), isA<AlbumModel>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockAlbumProvider();
      AlbumProvider ap;

      // return an unsuccessful response
      when(client.get(URL_TOKENLESS_HOME_1))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(ap.getAlbum(client), throwsException);
    });
  });
}
