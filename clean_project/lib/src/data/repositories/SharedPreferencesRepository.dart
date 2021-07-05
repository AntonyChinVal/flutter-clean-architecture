import 'package:clean_project/src/domain/repositories/SharedPreferencesRepository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: SharedPreferencesRepository)
class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
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
