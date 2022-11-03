import 'cache_helper.dart';

class CacheKeysManger {
  static String getUserTokenFromCache() =>
      CacheHelper.getData(key: 'accessToken') ?? '';

  static String getUserIdFromCache() =>
      CacheHelper.getData(key: 'userId') ?? '';
}