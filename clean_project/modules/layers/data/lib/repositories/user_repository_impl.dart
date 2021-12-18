import 'package:domain/model/generic_user.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:local_storage/local_storage.dart';
import 'package:networking/api_service.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiService _apiService;
  late final LocalStorageService _localStorageService;

  UserRepositoryImpl(this._apiService, this._localStorageService);

  @override
  Future<GenericUser> getUser() {
    return _apiService.get("user/get").then((response) {
      GenericUser user = GenericUser.fromJson(response);
      return user;
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future authenticate({String email = "", String password = ""}) async {
    try {
      String token = await _apiService.post<String>(
          "authentication/authenticate",
          data: {"email": email, "password": password});
      await _localStorageService.setValue(key: "token", value: token);
      await _apiService.addAuthInterceptor();
    } catch (error) {
      rethrow;
    }
  }
}
