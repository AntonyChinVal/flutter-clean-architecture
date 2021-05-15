import 'dart:async';
import 'package:clean_project/src/domain/core/index.dart';
import 'package:clean_project/src/domain/repositories/AuthenticationRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class FacebookLoginUseCase extends UseCase<UserCredential?, FacebookLoginUseCaseParams> {
  
  AuthenticationRepository _authenticationRepository;
  
  FacebookLoginUseCase(this._authenticationRepository) : super();

  @override
  Future<UserCredential?> execute(FacebookLoginUseCaseParams params) async{
    
      UserCredential credential = await this._authenticationRepository.facebookAuthenticate();

      return credential;
    
  }

}

class FacebookLoginUseCaseParams {
  
  FacebookLoginUseCaseParams();

}