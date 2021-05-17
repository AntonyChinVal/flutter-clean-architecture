import 'package:clean_project/src/domain/repositories/SharedPreferencesRepository.dart';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as : SharedPreferencesRepository)
class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository{

  @override
  Future<String> getValue({String? key}) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key!)!;
    print("Value from Shared Preferences");
    print(value);
    return value;
    
  }

  @override
  Future<void> setValue({String? key , String? value}) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key!, value!);
    
  }


}