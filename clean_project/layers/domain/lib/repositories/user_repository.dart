import 'package:domain/model/generic_user.dart';

abstract class UserRepository {
  Future<GenericUser> getUser();
  Future authenticate({String email, String password});
}
