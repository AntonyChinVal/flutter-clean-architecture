import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_presentation/configuration/general/session_controller.dart';
import 'package:getx_presentation/configuration/navigation/route_service.dart';
import 'package:get/get.dart';

class GetXMyApp extends StatelessWidget {
  late final GetXRouteService? _routeService;

  GetXMyApp({Key? key, GetXRouteService? routeService}) : super(key: key) {
    _routeService = routeService;
    Get.put(SessionController());
  }

  @override
  Widget build(BuildContext context) {
    return _routeService != null
        ? GetMaterialApp(
            initialRoute: GetXRouteName.loginScreen,
            getPages: _routeService!.generateRoutes(),
          )
        : const Text("No Routes setted");
  }
}
