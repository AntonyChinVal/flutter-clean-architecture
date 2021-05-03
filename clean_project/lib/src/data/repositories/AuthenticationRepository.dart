import 'package:clean_project/src/data/api/Api.dart';
import 'package:clean_project/src/domain/repositories/AuthenticationRepository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository{

  @override
  Future<String> authenticate({String email = "" , String password = ""}) {

    return dioApi.post<String>("authentication/authenticate", data: { 'email' : email, 'password' : password } )
    .then((response){
      print("Response authenticate");
      print(response);
        addAuthInterceptor();
        return response.data!;
      })
      .catchError((error){
          print("ERROR");
          print(error);
      });
      
  }

}