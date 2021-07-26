import 'package:clean_project/src/configuration/injection_configuration/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:presentation/configuration/App.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';

void configureApp() {
  runApp(MyApp(
      navigationService: getIt<NavigationService>(),
      routeService: getIt<RouteService>()));
}
