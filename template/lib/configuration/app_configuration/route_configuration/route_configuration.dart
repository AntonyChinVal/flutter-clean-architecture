import 'package:flutter/material.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';
import 'package:presentation/screens/login/login_screen.dart';
import 'package:presentation/screens/main/main_screen.dart';
import 'package:presentation/screens/topics/topics_screen.dart';
import 'package:template/configuration/injection_configuration/injection_container.dart';

class RouteServiceImpl extends RouteService {
  @override
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginScreen:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(globalGetIt<NavigationService>()),
            settings: settings);
      case RouteName.mainScreen:
        return MaterialPageRoute(
            builder: (_) => MainScreen(globalGetIt<NavigationService>()),
            settings: settings);
      case RouteName.topicsScreen:
        return MaterialPageRoute(
            builder: (_) => TopicsScreen(globalGetIt<NavigationService>()),
            settings: settings);
      default:
        throw Exception("Invalid route");
    }
  }
}
