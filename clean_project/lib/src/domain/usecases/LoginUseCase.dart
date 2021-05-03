import 'dart:async';
import 'dart:io';
import 'package:clean_project/src/domain/core/index.dart';
import 'package:clean_project/src/domain/entities/user/User.dart';
import 'package:clean_project/src/domain/repositories/AuthenticationRepository.dart';
import 'package:clean_project/src/domain/repositories/UserRepository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class LoginUseCase extends UseCase<User, LoginUseCaseParams> {
  
  AuthenticationRepository _authenticationRepository;
  UserRepository _userRepository;
  
  LoginUseCase(this._authenticationRepository, this._userRepository) : super();

  @override
  Future<User> execute(LoginUseCaseParams params) async{
    
    String token = await this._authenticationRepository.authenticate(email: params.email!,password: params.password!);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    User user = await this._userRepository.getUser();

    return user;

  }

}

class LoginUseCaseParams {
  
  String? email;
  String? password;

  LoginUseCaseParams({this.email, this.password});

}