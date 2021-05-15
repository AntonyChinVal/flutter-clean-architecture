import 'dart:async';
import 'package:clean_project/src/domain/core/index.dart';
import 'package:clean_project/src/domain/repositories/AuthenticationRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class GoogleLoginUseCase extends UseCase<UserCredential?, GoogleLoginUseCaseParams> {
  
  AuthenticationRepository _authenticationRepository;
  
  GoogleLoginUseCase(this._authenticationRepository) : super();

  @override
  Future<UserCredential?> execute(GoogleLoginUseCaseParams params) async{
    
      UserCredential credential = await this._authenticationRepository.googleAuthenticate();

      return credential;
    
  }

}

class GoogleLoginUseCaseParams {
  
  GoogleLoginUseCaseParams();

}