import 'package:flutter/material.dart';
import 'package:presentation/navigation/route_service.dart';
import 'package:presentation/screens/login/login_screen.dart';
import 'package:presentation/screens/main/main_screen.dart';
import 'package:presentation/screens/topics/topics_screen.dart';
import 'package:routemaster/routemaster.dart';

class RouteServiceImpl extends RouteService {
  @override
  RouteMap generateRoutes() {
    return RouteMap(
      routes: {
        '/': (_) => MaterialPage(
              child: LoginScreen(),
            ),
        RouteName.loginScreen: (_) => MaterialPage(
              child: LoginScreen(),
            ),
        RouteName.mainScreen: (_) => MaterialPage(child: MainScreen()),
        RouteName.topicsScreen: (_) => MaterialPage(child: TopicsScreen()),
      },
    );
  }
}
