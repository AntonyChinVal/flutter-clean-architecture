import 'package:flutter/material.dart';
import 'package:networking/networking.dart';
import 'package:presentation/app.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';
import 'package:template/configuration/injection_configuration/injection_container.dart';

void configureApp() {
  globalGetIt<NetworkingService>().addGeneralInterceptor();
  runApp(MyApp(
      navigationService: globalGetIt<NavigationService>(),
      routeService: globalGetIt<RouteService>()));
}
