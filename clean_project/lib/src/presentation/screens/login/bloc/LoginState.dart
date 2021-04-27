import 'package:clean_project/src/presentation/core/ScreenBloc.dart';

abstract class LoginState extends ScreenBlocState{
  LoginState(bool isLoading) : super(isLoading);
}

class LoginiInitState extends LoginState{
  LoginiInitState()  : super(false);
}

class AuthenticatingState extends LoginState{
  AuthenticatingState()  : super(true);
}