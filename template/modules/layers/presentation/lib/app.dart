import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:presentation/navigation/route_service.dart';
import 'package:routemaster/routemaster.dart';

final getIt = GetIt.instance;

final routemaster = RoutemasterDelegate(
    routesBuilder: (_) => getIt<RouteService>().generateRoutes());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerDelegate: routemaster,
        routeInformationParser: RoutemasterParser(),
      ),
    );
  }
}
