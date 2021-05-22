
import 'package:clean_project/src/presentation/screens/login/LoginScreen.dart';
import 'package:clean_project/src/presentation/screens/main/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class RouteService{

  Route<dynamic> generateRoutes(RouteSettings settings){

    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(), settings: settings);
      case MainScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => MainScreen(), settings: settings);
      default:
        throw Exception("Invalid route");
    }

  }

}