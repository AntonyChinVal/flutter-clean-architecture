import 'package:clean_project/src/presentation/core/BlocScreen.dart';

abstract class LoginState extends BlocState {
  LoginState(bool isLoading) : super(isLoading);
}

class LoginiInitState extends LoginState {
  LoginiInitState() : super(false);
}

class AuthenticatingState extends LoginState {
  AuthenticatingState() : super(true);
}
