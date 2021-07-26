import 'package:flutter/material.dart';

class RouteName {
  static const String loginScreen = "LoginScreen";
}

abstract class RouteService {
  Route<dynamic> generateRoutes(RouteSettings settings);
}
