import 'package:clean_project/src/domain/repositories/AuthenticationRepository.dart';

class TestAuthenticationRepository extends AuthenticationRepository {
  @override
  Future<String> authenticate({String email = "", String password = ""}) {
    return Future.delayed(
      Duration(seconds: 1),
      () => 'Token',
    );
  }
}
