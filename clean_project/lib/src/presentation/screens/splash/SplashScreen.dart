import 'dart:io';

import 'package:clean_project/src/presentation/components/templates/SplashTemplate.dart';
import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/splash/bloc/SplashBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends Screen {

  SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();

}

class SplashScreenState extends ScreenState<SplashBloc , SplashScreen>{

  SplashScreenState() : super(SplashBloc());

  @override
  void afterInitState(){

    stdout.writeln("Go To Login");

  }

  @override
  Widget buildTemplate() {

    return SplashTemplate(globalKey: this.globalKey);

  }

}