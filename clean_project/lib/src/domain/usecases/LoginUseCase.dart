import 'dart:async';
import 'package:clean_project/src/domain/core/index.dart';
import 'package:clean_project/src/domain/entities/user/AppUser.dart';
import 'package:clean_project/src/domain/repositories/AuthenticationRepository.dart';
import 'package:clean_project/src/domain/repositories/SharedPreferencesRepository.dart';
import 'package:clean_project/src/domain/repositories/UserRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase extends UseCase<AppUser, LoginUseCaseParams> {
  
  AuthenticationRepository _authenticationRepository;
  UserRepository _userRepository;
  SharedPreferencesRepository _sharedPreferencesRepository;
  
  LoginUseCase(this._authenticationRepository, this._userRepository, this._sharedPreferencesRepository) : super();

  @override
  Future<AppUser> execute(LoginUseCaseParams params) async{
    
    String token = await this._authenticationRepository.authenticate(email: params.email!,password: params.password!);
    await this._sharedPreferencesRepository.setValue(key: 'token', value: token);
    AppUser user = await this._userRepository.getUser();

    return user;

  }

}

class LoginUseCaseParams {
  
  String? email;
  String? password;

  LoginUseCaseParams({this.email, this.password});

}