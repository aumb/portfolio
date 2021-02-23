import 'package:portfolio/core/models/cache_object.dart';

class CacheManager {
  Duration durationToSave;
  //the url is the key
  Map<String, CacheObject> map = {};

  static final CacheManager _instance = CacheManager._internal();

  factory CacheManager() {
    return _instance;
  }

  CacheManager._internal();

  addToMap(String url, CacheObject cacheObject) {
    map.putIfAbsent(url, () => cacheObject);
  }

  /// Checks if the response is cached.
  /// If the response is cached and the duration is finished the
  /// function will return null
  CacheObject checkIfCached(String url) {
    if (map.containsKey(url)) {
      //Check the duration
      CacheObject object = map[url];
      var now = new DateTime.now();
      if (object.validUntil.isAfter(now)) {
        return object;
      } else {
        //Rmove the item from map because the duration has passed
        map.remove(url);
      }
    }
    return null;
  }

  invalidateCacheAndRestart() {
    //Removes all the cachedItems
    map = {};
  }
}
