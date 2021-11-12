import 'package:clean_project/src/configuration/injection_configuration/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';
import 'package:presentation/screens/login/login_notifier.dart';
import 'package:presentation/screens/login/login_screen.dart';
import 'package:presentation/screens/topics/topics_screen.dart';
import 'package:presentation/screens/topics/topics_notifier.dart';
import 'package:domain/use_cases/login_use_case.dart';
import 'package:domain/use_cases/get_topics_use_case.dart';
import 'package:presentation/screens/main/main_screen.dart';

class RouteServiceImpl extends RouteService {
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginScreen:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(
                LoginNotifier(loginUseCase: getIt<LoginUseCase>()),
                getIt<NavigationService>()),
            settings: settings);
      case RouteName.topicsSreen:
        return MaterialPageRoute(
            builder: (context) => TopicsScreen(
                TopicsNotifier(getTopicsUseCase: getIt<GetTopicsUseCase>()),
                getIt<NavigationService>()),
            settings: settings);
      case RouteName.mainScreen:
        return MaterialPageRoute(
            builder: (context) => MainScreen(getIt<NavigationService>()),
            settings: settings);
      default:
        throw Exception("Invalid route");
    }
  }
}
