

import 'package:clean_project/src/domain/entities/user/AppUser.dart';

abstract class UserRepository{

  Future<AppUser> getUser();
  
}