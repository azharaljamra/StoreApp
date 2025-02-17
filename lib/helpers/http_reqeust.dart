import 'package:dio/dio.dart';

class HttpRequest {
  HttpRequest._();
  static HttpRequest? _instance;
  static HttpRequest get instance {
    if (_instance == null) _instance = HttpRequest._();
    return _instance!;
  }

  Dio _d = Dio();
  Future<Response> get(String url) async {
    return await _d.get(url);
  }

  post() {}

}
