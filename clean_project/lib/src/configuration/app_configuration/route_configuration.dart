import 'package:clean_project/src/configuration/injection_configuration/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';
import 'package:presentation/screens/login/login_provider.dart';
import 'package:presentation/screens/login/login_screen.dart';
import 'package:domain/use_cases/login_use_case.dart';

class RouteServiceImpl extends RouteService {
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginScreen:
        return CupertinoPageRoute(
            builder: (context) => LoginScreen(LoginProvider(
                loginUseCase: getIt<LoginUseCase>(),
                navigationService: getIt<NavigationService>())),
            settings: settings);
      default:
        throw Exception("Invalid route");
    }
  }
}
