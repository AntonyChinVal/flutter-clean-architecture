import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalStorageService {
  Future<String> getValue({required String key});
  Future setValue({required String key, required String value});
  Future clear();
}

class LocalStorageServiceImpl extends LocalStorageService {
  final _storage = const FlutterSecureStorage();

  IOSOptions _getIOSOptions() =>
      IOSOptions(accessibility: IOSAccessibility.first_unlock);

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  Future<String> getValue({required String key}) async {
    try {
      String? value = await _storage.read(key: key);
      return value ?? '';
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future setValue({required String key, required String value}) async {
    try {
      await _storage.write(
          key: key,
          value: value,
          iOptions: _getIOSOptions(),
          aOptions: _getAndroidOptions());
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future clear() async {
    try {
      await _storage.deleteAll();
    } catch (ex) {
      rethrow;
    }
  }
}
