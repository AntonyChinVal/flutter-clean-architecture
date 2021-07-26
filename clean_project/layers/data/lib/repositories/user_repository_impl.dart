import 'package:data/api/api_service.dart';
import 'package:data/device/shared_preferences_service.dart';
import 'package:domain/model/generic_user/generic_user.dart';
import 'package:domain/repositories/generic_user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  ApiService? _apiService;
  SharedPreferencesService? _sharedPreferencesService;

  UserRepositoryImpl(ApiService apiService,
      SharedPreferencesService sharedPreferencesService) {
    this._apiService = apiService;
    this._sharedPreferencesService = sharedPreferencesService;
  }

  @override
  Future<GenericUser> getUser() {
    return _apiService!.get("user/get").then((response) {
      GenericUser user = GenericUser.fromJson(response);
      return user;
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future authenticate({String email = "", String password = ""}) async {
    try {
      String token = await this._apiService!.post<String>(
          "authentication/authenticate",
          data: {"email": email, "password": password});
      await this
          ._sharedPreferencesService
          ?.setValue(key: "token", value: token);
      this._apiService?.addAuthInterceptor();
    } catch (error) {
      throw error;
    }
  }
}
