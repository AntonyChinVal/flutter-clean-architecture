
abstract class AuthenticationRepository{

  Future<String> authenticate({String email , String password});
  
}