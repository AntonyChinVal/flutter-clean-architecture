import 'package:clean_project/src/configuration/injectionConfiguration/injection_container.dart';
import 'package:clean_project/src/presentation/configuration/bloc/general/GeneralBloc.dart';
import 'package:clean_project/src/presentation/configuration/navigation/NavigationService.dart';
import 'package:clean_project/src/presentation/configuration/navigation/RouteService.dart';
import 'package:clean_project/src/presentation/screens/login/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {

  final NavigationService _navigationService = getIt<NavigationService>();
  final RouteService _routeService = getIt<RouteService>();

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<GeneralBloc>(
          create: (context) => GeneralBloc(),
        )
      ],
      child: MaterialApp(
        navigatorKey: _navigationService.navigatorKey,
        title: 'My App',
        onGenerateRoute: _routeService.generateRoutes,
        initialRoute:  LoginScreen.routeName
      ),
    ); 
  }
}