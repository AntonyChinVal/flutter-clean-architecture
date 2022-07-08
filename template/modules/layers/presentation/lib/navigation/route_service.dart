import 'package:routemaster/routemaster.dart';

class RouteName {
  static const String loginScreen = "/login";
  static const String mainScreen = "/main";
  static const String topicsScreen = "/topics";
}

abstract class RouteService {
  RouteMap generateRoutes();
}
