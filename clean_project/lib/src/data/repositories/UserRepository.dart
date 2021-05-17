import 'package:clean_project/src/data/api/Api.dart';
import 'package:clean_project/src/domain/entities/user/AppUser.dart';
import 'package:clean_project/src/domain/repositories/UserRepository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : UserRepository)
class UserRepositoryImpl implements UserRepository{

  @override
  Future<AppUser> getUser() {
    
    return dioApiAuth.get("user/get")
    .then((response){
        print("Response Get User");
        print(response);
        AppUser user = AppUser.fromJson(response.data);
        return user;
      })
      .catchError((error){
          print("ERROR");
          print(error);
      });
      
  }

}