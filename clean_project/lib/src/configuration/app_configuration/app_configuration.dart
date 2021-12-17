import 'package:clean_project/src/configuration/injection_configuration/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:getx_presentation/app.dart';
import 'package:presentation/app.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:getx_presentation/configuration/navigation/route_service.dart';

void configureApp() {
  if (dotenv.env['WITH_GETX'] == "true") {
    runApp(GetXMyApp(routeService: getIt<GetXRouteService>()));
  } else {
    runApp(MyApp(
        navigationService: getIt<NavigationService>(),
        routeService: getIt<RouteService>()));
  }
}
