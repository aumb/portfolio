import 'package:dio/dio.dart';

class NetworkManager {
  static Dio client;

  static BaseOptions options = new BaseOptions(
    baseUrl: "https://floating-cove-36500.herokuapp.com/api/",
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );

  static Future<dynamic> get(String path,
      {ResponseType responseType, Map<String, String> headers}) async {
    if (responseType != null) {
      client.options.responseType = responseType;
    } else {
      client.options.responseType = ResponseType.json;
    }
    Response response = await client.get(path);
    if (responseType != ResponseType.bytes) {
      print(response.data);
    }
    return response.data;
  }

  init() {
    _setUpDio();
  }

  void _setUpDio() {
    client = Dio(options);
  }
}
