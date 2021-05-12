import 'package:clean_project/src/injection_container/injection_container.dart';
import 'package:clean_project/src/presentation/configuration/navigation/NavigationService.dart';
import 'package:clean_project/src/presentation/core/ScreenBloc.dart';
import 'package:clean_project/src/domain/usecases/LoginUseCase.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginState.dart';
import 'dart:io';

import 'package:clean_project/src/presentation/screens/main/MainScreen.dart';

class LoginBloc extends ScreenBloc<LoginSEvent, LoginState>{

  final LoginUseCase _loginUseCase = getIt<LoginUseCase>();
  final NavigationService _navigationService = getIt<NavigationService>();

  LoginBloc() : super(LoginiInitState());

  @override
  Stream<LoginState> mapEventToState(LoginSEvent event) async* {
    if(event is AunthenticateEvent){
      stdout.write("Auth Event");
      yield* _autenticate(event);
    }
  }

  Stream<LoginState> _autenticate(AunthenticateEvent event) async*{
    try {

      stdout.write("Auth Event Execute");
      yield AuthenticatingState();
      LoginUseCaseParams params = LoginUseCaseParams(email : event.username, password :event.password);
      await this._loginUseCase.execute(params);
      yield LoginiInitState();
      _navigationService.navigateTo(MainScreen.routeName);
      event.onSuccess();
      
    } catch (_) {

      yield LoginiInitState();

    }
  }

}