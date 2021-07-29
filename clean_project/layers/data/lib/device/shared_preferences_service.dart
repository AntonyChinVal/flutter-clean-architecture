import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesService {
  Future<String> getValue({String? key});
  Future<void> setValue({String? key, String? value});
}

class SharedPreferencesServiceImpl extends SharedPreferencesService {
  @override
  Future<String> getValue({String? key}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String value = prefs.getString(key!)!;
      return value;
    } catch (ex) {
      throw ex;
    }
  }

  @override
  Future<void> setValue({String? key, String? value}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key!, value!);
    } catch (ex) {
      throw ex;
    }
  }
}
