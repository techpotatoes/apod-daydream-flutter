import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ApodCacheManager extends BaseCacheManager {
  static const key = "libCachedData";

  static ApodCacheManager _instance;

  factory ApodCacheManager() {
    if (_instance == null) {
      _instance = new ApodCacheManager._();
    }
    return _instance;
  }

  ApodCacheManager._() : super(key, maxAgeCacheObject: Duration(hours: 12));

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return path.join(directory.path, key);
  }
}