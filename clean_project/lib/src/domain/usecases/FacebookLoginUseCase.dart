import 'dart:async';
import 'package:clean_project/src/domain/core/index.dart';
import 'package:clean_project/src/domain/entities/user/AppUser.dart';
import 'package:clean_project/src/domain/repositories/AuthenticationRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FacebookLoginUseCase extends UseCase<AppUser?, FacebookLoginUseCaseParams> {
  
  AuthenticationRepository _authenticationRepository;
  
  FacebookLoginUseCase(this._authenticationRepository) : super();

  @override
  Future<AppUser?> execute(FacebookLoginUseCaseParams params) async{
    
      AppUser appUser = await this._authenticationRepository.facebookAuthenticate();

      return appUser;
    
  }

}

class FacebookLoginUseCaseParams {
  
  FacebookLoginUseCaseParams();

}