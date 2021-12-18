import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:presentation/configuration/general/session_provider.dart';
import 'package:presentation/configuration/navigation/navigation_service.dart';
import 'package:presentation/configuration/navigation/route_service.dart';

final sessionProvider = ChangeNotifierProvider((ref) => SessionProvider());

class MyApp extends StatelessWidget {
  late final NavigationService? _navigationService;
  late final RouteService? _routeService;

  MyApp(
      {Key? key,
      NavigationService? navigationService,
      RouteService? routeService})
      : super(key: key) {
    _navigationService = navigationService;
    _routeService = routeService;
  }

  @override
  Widget build(BuildContext context) {
    return _routeService != null
        ? ProviderScope(
            child: MaterialApp(
                navigatorKey: _navigationService?.navigatorKey,
                title: 'My App',
                onGenerateRoute: _routeService?.generateRoutes,
                initialRoute: RouteName.loginScreen),
          )
        : const Text("No Routes setted");
  }
}
