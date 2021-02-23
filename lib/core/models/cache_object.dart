class CacheObject {
  DateTime validUntil;
  dynamic cachedResponse;

  CacheObject({
    this.validUntil,
    this.cachedResponse,
  });
}
