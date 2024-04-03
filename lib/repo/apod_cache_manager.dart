import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

abstract class ApodCacheManager extends BaseCacheManager {
  static const key = "libCachedData";

  factory ApodCacheManager() {
    return ApodCacheManager();
  }

  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return path.join(directory.path, key);
  }
}