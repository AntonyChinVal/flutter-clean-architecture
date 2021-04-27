
abstract class AuthenticationRepository{

  Future<Map<String, String>> authenticate({String email , String password});
  
}