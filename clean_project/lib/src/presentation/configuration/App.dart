

import 'package:clean_project/src/presentation/configuration/bloc/general/GeneralBloc.dart';
import 'package:clean_project/src/presentation/screens/login/LoginScreen.dart';
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
        home: LoginScreen(),
      ),
    ); 
  }
}