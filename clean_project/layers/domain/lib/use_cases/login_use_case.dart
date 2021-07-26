import 'dart:async';

import 'package:domain/core/use_case.dart';
import 'package:domain/model/generic_user/generic_user.dart';
import 'package:domain/repositories/generic_user_repository.dart';

class LoginUseCase extends UseCase<GenericUser?, LoginUseCaseParams> {
  UserRepository? _userRepository;

  LoginUseCase(this._userRepository) : super();

  @override
  Future<GenericUser?> execute(LoginUseCaseParams params) async {
    try {
      await this
          ._userRepository!
          .authenticate(email: params.email!, password: params.password!);
      GenericUser user = await this._userRepository!.getUser();
      return user;
    } catch (ex) {
      return null;
    }
  }
}

class LoginUseCaseParams {
  String? email;
  String? password;

  LoginUseCaseParams({this.email, this.password});
}
