import 'package:clean_project/src/presentation/core/BlocScreen.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'LoginTemplate.dart';

class LoginScreen extends StatelessBlocScreen<LoginBloc> {
  static const String routeName = "Login";
  LoginScreen() : super(LoginBloc());
  LoginScreen.test(LoginBloc bloc) : super(bloc);

  void login(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      this.bloc.add(AuthenticateEvent(email, password));
    }
  }

  void onForgetPassword() {}

  @override
  Widget buildTemplate() {
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: this.bloc,
        builder: (context, state) => LoginTemplate(
              onLogin: this.login,
              onForgetPassword: this.onForgetPassword,
              inAsyncCall: state.inAsyncCall,
            ));
  }
}
