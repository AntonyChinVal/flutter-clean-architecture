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
    Get.put(SessionController());
  }

  @override
  Widget build(BuildContext context) {
    return this._routeService != null
        ? GetMaterialApp(
            initialRoute: GetXRouteName.loginScreen,
            getPages: this._routeService!.generateRoutes(),
          )
        : Text("No Routes setted");
  }
}
