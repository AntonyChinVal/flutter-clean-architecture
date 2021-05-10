import 'package:clean_project/src/presentation/components/templates/LoginTemplate.dart';
import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends Screen {

  LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();

}

class LoginScreenState extends ScreenState<LoginBloc , LoginScreen>{

  LoginScreenState() : super(LoginBloc());

  void login(String email , String password){
    if(email.isNotEmpty && password.isNotEmpty){
      this.bloc.add(AunthenticateEvent(email, password, (){
        Navigator.of(context).pushNamed("main");
      }, (){}));
    }

  }

  void onForgetPassword(){
  }

  @override
  Widget buildTemplate() {
    return LoginTemplate(
      globalKey: this.globalKey,
      onLogin: this.login,
      onForgetPassword: this.onForgetPassword,
      inAsyncCall: this.bloc.state.inAsyncCall,
    );
  }

}