import 'package:flutter/material.dart';
import 'package:networking/networking.dart';
import 'package:presentation/app.dart';
import 'package:template/configuration/injection_configuration/injection_container.dart';

void configureApp() async {
  await globalGetIt<NetworkingService>().addGeneralInterceptor();
  runApp(MyApp());
}
