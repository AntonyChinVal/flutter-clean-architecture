import 'package:clean_project/src/injection_container/injection_container.dart';
import 'package:clean_project/src/presentation/configuration/App.dart';
import 'package:flutter/material.dart';

void main(){
  configureInjection();
  runApp(MyApp());
}

