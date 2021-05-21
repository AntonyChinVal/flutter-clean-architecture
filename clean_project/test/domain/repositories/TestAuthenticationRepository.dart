import 'package:clean_project/src/domain/entities/user/AppUser.dart';
import 'package:clean_project/src/domain/repositories/AuthenticationRepository.dart';

class TestAuthenticationRepository extends AuthenticationRepository {
  @override
  Future<String> authenticate({String email = "", String password = ""}) {
    return Future.delayed(
      Duration(seconds: 2),
      () => 'Token',
    );
  }

  @override
  Future<AppUser> facebookAuthenticate() {
    return Future.delayed(
      Duration(seconds: 2),
      () => AppUser(),
    );
  }

  @override
  Future<AppUser> googleAuthenticate() {
    return Future.delayed(
      Duration(seconds: 2),
      () => AppUser(),
    );
  }
}
