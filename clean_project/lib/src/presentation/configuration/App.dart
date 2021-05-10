

import 'package:clean_project/src/presentation/configuration/bloc/general/GeneralBloc.dart';
import 'package:clean_project/src/presentation/screens/fieldList/FieldListScreen.dart';
import 'package:clean_project/src/presentation/screens/login/LoginScreen.dart';
import 'package:clean_project/src/presentation/screens/main/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<GeneralBloc>(
          create: (context) => GeneralBloc(),
        )
      ],
      child: MaterialApp(
        title: 'My App',
        home: Navigator(
          initialRoute:  "login",
          onGenerateRoute: (RouteSettings settings){
            switch (settings.name) {
              case 'login':
                return MaterialPageRoute(
                    builder: (context) => LoginScreen(), settings: settings);
              case 'main':
                return MaterialPageRoute(
                    builder: (context) => MainScreen(), settings: settings);
              default:
                throw Exception("Invalid route");
            }
          },
        ),
      ),
    ); 
  }
}