
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository{

  Future<String> authenticate({String email , String password});
  Future<UserCredential> googleAuthenticate();
  Future<UserCredential> facebookAuthenticate();
  
}