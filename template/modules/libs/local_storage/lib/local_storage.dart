import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future<String> getValue({required String key});
  Future setValue({required String key, required String value});
  Future clear();
}

class LocalStorageServiceImpl extends LocalStorageService {
  @override
  Future<String> getValue({required String key}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String value = prefs.getString(key)!;
      return value;
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future setValue({required String key, required String value}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future clear() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (ex) {
      rethrow;
    }
  }
}
