import 'package:clean_project/src/presentation/components/templates/LoginTemplate.dart';
import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/fieldList/FieldListScreen.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:clean_project/src/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:clean_project/src/presentation/screens/splash/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
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
      stdout.write("On Login");
      this.bloc.add(AunthenticateEvent(email, password, (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FieldListScreen()));
      }, (){}));
    }

  }

  void onForgetPassword(){

    stdout.write("On Forget Password");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SplashScreen()));
    
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