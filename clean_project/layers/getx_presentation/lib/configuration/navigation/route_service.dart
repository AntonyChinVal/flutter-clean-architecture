import 'package:get/get.dart';

class GetXRouteName {
  static const String loginScreen = "/login";
}

abstract class GetXRouteService {
  List<GetPage> generateRoutes();
}
