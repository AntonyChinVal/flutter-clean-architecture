import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_presentation/configuration/general/session_controller.dart';
import 'package:getx_presentation/configuration/navigation/route_service.dart';
import 'package:get/get.dart';

class GetXMyApp extends StatelessWidget {
  late final GetXRouteService? _routeService;

  GetXMyApp({routeService: GetXRouteService}) {
    this._routeService = routeService;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SessionController());
    return this._routeService != null
        ? GetMaterialApp(
            getPages: this._routeService!.generateRoutes(),
            initialRoute: GetXRouteName.loginScreen,
          )
        : Text("No Routes setted");
  }
}
