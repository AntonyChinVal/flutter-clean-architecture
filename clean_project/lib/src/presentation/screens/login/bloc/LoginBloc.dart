import 'package:clean_project/src/domain/usecases/FacebookLoginUseCase.dart';
import 'package:clean_project/src/injection_container/injection_container.dart';
import 'package:clean_project/src/presentation/configuration/navigation/NavigationService.dart';
import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:clean_project/src/domain/usecases/LoginUseCase.dart';
import 'package:clean_project/src/domain/usecases/GoogleLoginUseCase.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginState.dart';
import 'dart:io';
import 'package:clean_project/src/presentation/screens/main/MainScreen.dart';

class LoginBloc extends ScreenBloc<LoginSEvent, LoginState>{

  final LoginUseCase _loginUseCase = getIt<LoginUseCase>();
  final GoogleLoginUseCase _googleLoginUseCase = getIt<GoogleLoginUseCase>();
  final FacebookLoginUseCase _facebookLoginUseCase = getIt<FacebookLoginUseCase>();
  final NavigationService _navigationService = getIt<NavigationService>();

  LoginBloc() : super(LoginiInitState());

  @override
  Stream<LoginState> mapEventToState(LoginSEvent event) async* {
    if(event is AunthenticateEvent){
      print("Auth Event");
      yield* _autenticate(event);
    }else if(event is GooggleAunthenticateEvent){
      print("Google Auth Event");
      yield* _googleAutenticate(event);
    }else if(event is FacebookAunthenticateEvent){
      print("Facebook Auth Event");
      yield* _facebookutenticate(event);
    }
  }

  Stream<LoginState> _autenticate(AunthenticateEvent event) async*{
    try {

      print("Auth Event Execute");
      yield AuthenticatingState();
      LoginUseCaseParams params = LoginUseCaseParams(email : event.username, password :event.password);
      await this._loginUseCase.execute(params);
      yield LoginiInitState();
      _navigationService.replaceTo(MainScreen.routeName);
      event.onSuccess();
      
    } catch (_) {

      yield LoginiInitState();

    }

  }

  Stream<LoginState> _googleAutenticate(GooggleAunthenticateEvent event) async*{
    try {

      print("Auth Event Execute");
      yield AuthenticatingState();
      await this._googleLoginUseCase.execute(GoogleLoginUseCaseParams());
      yield LoginiInitState();
      _navigationService.navigateTo(MainScreen.routeName);
      
    } catch (_) {

      yield LoginiInitState();

    }
    
  }

  Stream<LoginState> _facebookutenticate(FacebookAunthenticateEvent event) async*{
    try {

      print("Auth Event Execute");
      yield AuthenticatingState();
      await this._facebookLoginUseCase.execute(FacebookLoginUseCaseParams());
      yield LoginiInitState();
      _navigationService.navigateTo(MainScreen.routeName);
      
    } catch (_) {

      yield LoginiInitState();

    }
    
  }

}