import 'package:domain/entity/user_entity.dart';
import 'package:domain/repositories/user_repository.dart';
import 'package:local_storage/local_storage.dart';
import 'package:networking/networking.dart';

class UserRepositoryImpl implements UserRepository {
  final NetworkingService _networkingService;
  late final LocalStorageService _localStorageService;

  UserRepositoryImpl(this._networkingService, this._localStorageService);

  @override
  Future<SessionUser> getSessionUser() {
    return _networkingService.get("user/get").then((response) {
      SessionUser user = SessionUser.fromJson(response);
      return user;
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future authenticate({String username = "", String password = ""}) async {
    try {
      String? token = await _networkingService.post<String>("auth/signin",
          data: {"username": username, "password": password});
      await _localStorageService.setValue(key: "token", value: token!);
    } catch (error) {
      rethrow;
    }
  }
}
