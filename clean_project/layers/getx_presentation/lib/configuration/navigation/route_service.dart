import 'package:get/get.dart';

class GetXRouteName {
  static const String loginScreen = "/login";
  static const String mainScreen = "/main";
}

abstract class GetXRouteService {
  List<GetPage> generateRoutes();
}
