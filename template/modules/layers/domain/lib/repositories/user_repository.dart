import 'package:domain/entity/user_entity.dart';

abstract class UserRepository {
  Future authenticate({String username, String password});
  Future<SessionUser> getSessionUser();
}
