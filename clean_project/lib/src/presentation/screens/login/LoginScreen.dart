import 'package:clean_project/src/presentation/components/templates/LoginTemplate.dart';
import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends Screen {
  static const String routeName = "Login";
  LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ScreenState<LoginBloc, LoginScreen> {
  LoginScreenState() : super(LoginBloc());
  LoginScreenState.test(LoginBloc? loginBloc) : super(loginBloc);

  void login(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      this.bloc?.add(AuthenticateEvent(email, password));
    }
  }

  void onForgetPassword() {}

  @override
  Widget buildTemplate() {
    return LoginTemplate(
      onLogin: this.login,
      onForgetPassword: this.onForgetPassword,
      inAsyncCall: this.bloc?.state.inAsyncCall,
    );
  }
}
