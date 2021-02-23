import 'package:dio/dio.dart';
import 'package:portfolio/core/core.dart';

class NetworkManager {
  static Dio client;

  static Map<String, String> defaultHeaders = {};

  static BaseOptions options = new BaseOptions(
    baseUrl: "https://floating-cove-36500.herokuapp.com/api/",
    connectTimeout: 5000,
    receiveTimeout: 5000,
  );

  static Map<String, String> setHeaders(Map<String, String> headers) {
    Map<String, String> requestHeaders = Map.from(defaultHeaders);
    if (headers != null) {
      headers.forEach((header, value) => requestHeaders[header] = value);
    }
    return requestHeaders;
  }

  ///A modified get function for less code repetitivness
  static Future<dynamic> get(
    String url, {
    ResponseType responseType,
    Map<String, String> headers,
    Map<String, dynamic> params,
  }) async {
    client.options.queryParameters = params;
    client.options.headers = setHeaders(headers);
    client.options.responseType = responseType;

    //Check if the request is in cache
    CacheManager cacheManager = CacheManager();
    CacheObject cacheObject = cacheManager.checkIfCached(url);

    //Return the response from cache if it exists
    if (cacheObject != null) {
      return cacheObject.cachedResponse;
    }

    //Fetching the request
    try {
      Response response = await client.get(url);
      //Create the cache object based on the cache-control header. If the time retrieved is less than 60 seconds, hardcode it to 60
      int cacheTimeSeconds = 0;
      if (response.headers != null &&
          response.headers['cache-control'] != null) {
        String cacheControl = response.headers.map['cache-control'].first;
        int x = int.tryParse(cacheControl.split("=").last);
        if (x != null) {
          cacheTimeSeconds = x;
        } else {
          cacheTimeSeconds = 3600;
        }
      }
      var now = new DateTime.now();
      var validUntil = now.add(Duration(seconds: cacheTimeSeconds));
      CacheObject newCacheObject = CacheObject(
        validUntil: validUntil,
        cachedResponse: response.data,
      );
      cacheManager.addToMap(url, newCacheObject);

      return response.data;
    } catch (e) {
      throw e;
    }
  }

  ///A modified post function for less code repetitivness
  static Future<dynamic> post(
    String url,
    dynamic body, {
    Map<String, dynamic> params,
    Map<String, String> headers,
    ResponseType responseType,
  }) async {
    client.options.queryParameters = params;
    client.options.responseType = responseType;
    client.options.headers = setHeaders(headers);

    try {
      Response response = await client.post(url, data: body);
      CacheManager().invalidateCacheAndRestart();
      return response?.data;
    } catch (e) {
      throw e;
    }
  }

  ///A modified delete function for less code repetitivness
  static Future<dynamic> delete(
    String url, {
    dynamic body,
    Map<String, dynamic> params,
    Map<String, String> headers,
    ResponseType responseType,
  }) async {
    client.options.queryParameters = params;
    client.options.responseType = responseType;
    client.options.headers = setHeaders(headers);

    try {
      Response response = await client.delete(url, data: body);

      CacheManager().invalidateCacheAndRestart();
      return response?.data;
    } catch (e) {
      throw e;
    }
  }

  init() {
    _setUpDio();
  }

  void _setUpDio() {
    client = Dio(options);
  }
}
