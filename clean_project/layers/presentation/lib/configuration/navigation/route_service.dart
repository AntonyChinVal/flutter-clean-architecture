import 'package:flutter/material.dart';

class RouteName {
  static const String loginScreen = "login";
  static const String mainScreen = "main";
}

abstract class RouteService {
  Route<dynamic> generateRoutes(RouteSettings settings);
}
