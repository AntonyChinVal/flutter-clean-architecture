import 'dart:async';
import 'dart:io';
import 'package:clean_project/src/domain/core/index.dart';
import 'package:clean_project/src/domain/entities/user/User.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase extends UseCase<User, LoginUseCaseParams> {
  
  LoginUseCase() : super();

  @override
  Future<User> execute(LoginUseCaseParams params) async{

    stdout.write("Se ejecuto login");
    return new User();

  }

}

class LoginUseCaseParams {

  LoginUseCaseParams({String? email, String? password});

}