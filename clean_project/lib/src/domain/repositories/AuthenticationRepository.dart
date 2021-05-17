
import 'package:clean_project/src/domain/entities/user/AppUser.dart';

abstract class AuthenticationRepository{

  Future<String> authenticate({String email , String password});
  Future<AppUser> googleAuthenticate();
  Future<AppUser> facebookAuthenticate();
  
}