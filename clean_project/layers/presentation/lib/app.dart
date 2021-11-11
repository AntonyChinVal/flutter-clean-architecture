import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:presentation/configuration/general/session_provider.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';

final sessionProvider = ChangeNotifierProvider((ref) => SessionProvider());

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
        ? ProviderScope(
            child: MaterialApp(
                navigatorKey: _navigationService?.navigatorKey,
                title: 'My App',
                onGenerateRoute: _routeService?.generateRoutes,
                initialRoute: RouteName.loginScreen),
          )
        : Text("No Routes setted");
  }
}
