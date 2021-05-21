import 'package:clean_project/src/domain/entities/user/AppUser.dart';
import 'package:clean_project/src/domain/repositories/UserRepository.dart';

class TestUserRepository extends UserRepository {
  @override
  Future<AppUser> getUser() {
    return Future.delayed(
      Duration(seconds: 2),
      () => AppUser(),
    );
    ;
  }
}
