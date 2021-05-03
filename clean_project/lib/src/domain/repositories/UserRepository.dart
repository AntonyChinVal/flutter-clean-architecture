import 'package:clean_project/src/domain/entities/user/User.dart';

abstract class UserRepository{

  Future<User> getUser();
  
}