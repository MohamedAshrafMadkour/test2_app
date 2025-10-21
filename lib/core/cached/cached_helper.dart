import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test2_app/core/helper/get_it_setup.dart';

class CachedHelper {
  static final storage = getIt<FlutterSecureStorage>();

  static Future<void> saveData({
    required String key,
    required String value,
  }) async {
    await storage.write(key: key, value: value);
  }

  static Future<String> getData({required String key}) async {
    return await storage.read(key: key) ?? '';
  }

  static Future<void> deleteData({required String key}) async {
    await storage.delete(key: key);
  }
}
