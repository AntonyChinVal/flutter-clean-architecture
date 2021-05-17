import 'dart:async';
import 'package:clean_project/src/domain/core/index.dart';
import 'package:clean_project/src/domain/entities/user/AppUser.dart';
import 'package:clean_project/src/domain/repositories/AuthenticationRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GoogleLoginUseCase extends UseCase<AppUser?, GoogleLoginUseCaseParams> {
  
  AuthenticationRepository _authenticationRepository;
  
  GoogleLoginUseCase(this._authenticationRepository) : super();

  @override
  Future<AppUser?> execute(GoogleLoginUseCaseParams params) async{
    
      AppUser appUser = await this._authenticationRepository.googleAuthenticate();

      return appUser;
    
  }

}

class GoogleLoginUseCaseParams {
  
  GoogleLoginUseCaseParams();

}