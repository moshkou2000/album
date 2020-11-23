import 'package:http/http.dart';

abstract class HttpProvider {
  Future<Response> get(String url, {Map<String, String> headers});

// unused
  Future<Response> post(String url,
      {Map<String, String> headers, dynamic body});

// unused
  Future<Response> patch(String url,
      {Map<String, String> headers, dynamic body});

  void close();
}
