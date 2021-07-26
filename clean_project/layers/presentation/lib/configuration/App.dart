import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presentation/configuration/general/session_notifier.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  late final NavigationService? _navigationService;
  late final RouteService? _routeService;

  MyApp({navigationService: NavigationService, routeService: RouteService}) {
    this._navigationService = navigationService;
    this._routeService = routeService;
  }

  @override
  Widget build(BuildContext context) {
    return this._routeService != null
        ? MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => SessionProvder()),
            ],
            child: MaterialApp(
                navigatorKey: _navigationService?.navigatorKey,
                title: 'My App',
                onGenerateRoute: _routeService?.generateRoutes,
                initialRoute: RouteName.loginScreen),
          )
        : Text("No Routes setted");
  }
}
